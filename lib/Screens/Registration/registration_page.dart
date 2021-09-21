import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comfortley_web/Models/button.dart';
import 'package:comfortley_web/Models/text_field.dart';
import 'package:comfortley_web/Screens/HomePage/home_page.dart';
import 'package:comfortley_web/Screens/Login/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants.dart';

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _checkBox = false;
  final _key = GlobalKey<FormState>();

  _register(String username, String email, int contact, String password) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) {
      FirebaseFirestore.instance.collection('Users').doc(email).set({
        'Username': username,
        'Email': email,
        'Contact': contact,
      }).then((value) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) {
          return HomePage();
        }));
      }).catchError((onError) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Error'),
                content: Text(onError.toString()),
                actions: [
                  Container(
                    alignment: Alignment.center,
                    height: 45,
                    margin: EdgeInsets.only(top: 20.0,left: 50.0,right: 50.0,bottom: 0.0),
                    child: CustomButton(
                      text: 'Ok',
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ],
              );
            });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Constants.primaryColor, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      backgroundColor: Constants.secondaryColor,
      body: SafeArea(
        child: Form(
          key: _key,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40, bottom: 15),
                  alignment: Alignment.topCenter,
                    child: Text(
                      "COMFORTLEY",
                      style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 32,
                      color: Constants.primaryColor,
                      letterSpacing: 0.5),
                    ),
                ),
                CustomTextField(
                  verticalMargin: 10,
                  horizontalMargin: 40,
                  text: 'Username',
                  suffixIcon: Icon(
                    FluentIcons.person_24_regular,
                    color: Constants.primaryColor,
                  ),
                  inputType: TextInputType.name,
                  controller: _nameController,
                  validator: (String? name) {
                    if (name!.isEmpty) {
                      return "Username can't be empty!";
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  verticalMargin: 10,
                  horizontalMargin: 40,
                  text: 'Email',
                  suffixIcon: Icon(
                    FluentIcons.mail_24_regular,
                    color: Constants.primaryColor,
                  ),
                  inputType: TextInputType.name,
                  controller: _emailController,
                  validator: (String? email) {
                    if (email!.isEmpty) {
                      return "Email can't be empty!";
                    } else if (!(email.contains("@"))) {
                      return "Please enter a valid email!";
                    } else if (!(email.contains(".com"))) {
                      return "Please enter a valid email!";
                    }
                    return null;
                  },
                ),
                CustomTextField(
                  verticalMargin: 10,
                  horizontalMargin: 40,
                  text: 'Phone Number',
                  suffixIcon: Icon(
                    FluentIcons.phone_24_regular,
                    color: Constants.primaryColor,
                  ),
                  inputType: TextInputType.phone,
                  validator: (String? phone) {
                    if (phone!.isEmpty) {
                      return "Phone Number can't be empty!";
                    } else if (phone.length <= 11) {
                      return "Please enter a valid phone number!";
                    }
                    return null;
                  },
                  controller: _phoneController,
                ),
                CustomTextField(
                  verticalMargin: 10,
                  horizontalMargin: 40,
                text: 'Password',
                  suffixIcon: Icon(
                    FluentIcons.password_24_regular,
                    color: Constants.primaryColor,
                  ),
                  inputType: TextInputType.visiblePassword,
                  hideText: true,
                  validator: (String? password) {
                    if (password!.isEmpty) {
                      return "Password can't be empty!";
                    } else if (password.length < 8) {
                      return "Password must be at least 8 characters long!";
                    }
                    return null;
                  },
                  controller: _passwordController,
                ),
                Container(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                       setState(() {
                          _checkBox = !_checkBox;
                        });
                      },
                      child: Checkbox(
                        onChanged: (value) {
                          setState(() {
                            _checkBox = !_checkBox;
                          });
                        },
                        value: _checkBox,
                        checkColor: Constants.secondaryColor,
                        activeColor: Constants.primaryColor,
                        focusColor: Constants.secondaryColor,
                      ),
                    ),
                    Text(
                      'I read and agree to ',
                    ),
                    Text(
                      'Terms and Conditions',
                      style: TextStyle(
                      color: Constants.primaryColor,
                    ),
                  ),
                ],
              ),
              Container(
                height: 80,
                margin: EdgeInsets.only(top: 0.0,left: 40.0,right: 40.0,bottom: 0.0),
                child: CustomButton(
                  margin: 20,
                  padding:40,
                  iconName: Icons.app_registration,
                  text: 'Register',
                  onPressed: () {
                    if (_key.currentState!.validate()) {
                      if (_checkBox) {
                        String username = _nameController.text.toString().trim();
                        String email = _emailController.text.toString().trim();
                        int contact = int.parse(_phoneController.text.toString().trim());
                        String password = _passwordController.text.toString().trim();
                        _register(username, email, contact, password);
                      } else {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text(
                                  "Error",
                                ),
                                content: Text(
                                  "You must agree to the terms and conditions!",
                                ),
                                actions: [
                                  TextButton(
                                    child: Text(
                                      'Ok',
                                      style: TextStyle(
                                        color: Constants.primaryColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            });
                      }
                    }
                  },
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Register with',
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 4),
                    child: Card(
                      elevation: 10.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Constants.secondaryColor,
                          child: Image.asset('icons/google.png')),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 4),
                    child: Card(
                      elevation: 10.0,
                      shape: CircleBorder(),
                      child: CircleAvatar(
                          radius: 27,
                          child: Image.asset('icons/fb.png')),
                    ),
                  ),
                ],
              ),
              Container(
                height: 20,
              ),
              Container(
                alignment: Alignment.bottomCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) {
                            return Login();
                          }
                        ));
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Constants.primaryColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 10,
              ),
            ],
          ),
        ),
    ),
      ),
    );
  }
}
