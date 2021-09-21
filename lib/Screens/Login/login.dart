import 'package:comfortley_web/Models/button.dart';
import 'package:comfortley_web/Models/text_field.dart';
import 'package:comfortley_web/Screens/HomePage/home_page.dart';
import 'package:comfortley_web/Screens/Registration/registration_page.dart';
import 'package:comfortley_web/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool passwordNotVisible = true;
  bool wrongPassword = false;
  bool emailAlreadyExist = false;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Constants.primaryColor, //or set color with: Color(0xFF0000FF)
    ));
    return SafeArea(
      child: Scaffold(
        backgroundColor: Constants.secondaryColor,
        body: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, bottom: 50),
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
                          text: "Email:",
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
                          controller: _emailController,
                          inputType: TextInputType.emailAddress,
                          suffixIcon: Icon(
                            FluentIcons.person_24_regular,
                            color: Constants.primaryColor,
                          ),
                        ),
                        CustomTextField(
                          verticalMargin: 10,
                          horizontalMargin: 40,
                          hideText: passwordNotVisible,
                          controller: _passwordController,
                          text: 'Password',
                          suffixIcon: Icon(
                            FluentIcons.password_24_regular,
                            color: Constants.primaryColor,
                          ),
                          validator: (String? password) {
                            if (password!.isEmpty) {
                              return "Password can't be empty!";
                            } else if (password.length < 8) {
                              return "Password can't be less than 8 characters!";
                            }
                            return null;
                          },
                        ),
                        Container(
                          height: 80,
                          margin: EdgeInsets.only(top: 20.0,left: 40.0,right: 40.0,bottom: 0.0),
                          child: CustomButton(
                            margin: 20,
                            padding: 40,
                            iconName: Icons.login,
                            text: 'Login',
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                String email = _emailController.text;
                                String password = _passwordController.text;
                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: email, password: password)
                                    .then((value) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) {
                                    return HomePage();
                                  },),);
                                },).catchError((error) {
                                  if (error.code == 'user-not-found') {
                                    setState(() {
                                      emailAlreadyExist = true;
                                    });
                                  } else {
                                    setState(() {
                                      emailAlreadyExist = false;
                                    });
                                  }
                                  if (error.code == 'wrong-password') {
                                    setState(() {
                                      wrongPassword = true;
                                    });
                                  } else {
                                    setState(() {
                                      wrongPassword = false;
                                    });
                                  }
                                });
                              } else {
                                print('Error');
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
                      ],
                    ),
                  ),
                  //      ),
                  Container(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    margin: EdgeInsets.only(bottom: 20.0),
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Don\'t have an account? ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(
                                builder: (BuildContext context) {
                              return Registration();
                            },),);
                          },
                          child: Text(
                            'Create one now! ',
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
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
