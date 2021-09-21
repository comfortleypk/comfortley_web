import 'package:comfortley_web/Models/drawer.dart';
import 'package:comfortley_web/Screens/CartCurrentLocation/cart_current_location.dart';
import 'package:comfortley_web/Screens/HomePage/home_page.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';
import 'change_alert_box.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Constants.primaryColor, //or set color with: Color(0xFF0000FF)
    ),);
    return Scaffold(
      backgroundColor: Constants.secondaryColor,
      appBar: AppBar(
        backgroundColor: Constants.secondaryColor,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Constants.primaryColor,
          ),
          tooltip: "Go Back",
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return HomePage();
                }
            ),);
          },
        ),
        title: InkWell(
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return HomePage();
                }));
          },
          child: Text(
            "Comfortley",
            style: TextStyle(
                color: Constants.primaryColor, fontSize: Constants.fontSize1,),
          ),
        ),
        actions: <Widget>[
          IconButton(
            tooltip: "Food Cart",
            icon: Icon(
              FluentIcons.cart_24_regular,
              color: Constants.primaryColor,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return Cart();
                  },),);
            },
          ),
          IconButton(
            tooltip: "User Profile",
            icon: Icon(
              FluentIcons.person_24_regular,
              color: Constants.primaryColor,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return Profile();
                  },),);
            },
          ),
        ],
      ),
      drawer: CustomDrawer.drawer(context),
      body: SingleChildScrollView(
          child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: 50),
            padding: EdgeInsets.only(top: 10),
            child: CircleAvatar(
              backgroundImage: AssetImage("images/meal.jpg"),
              radius: 100,
              child: Container(
                child: IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Constants.primaryColor,
                  ),
                  onPressed: () {
                    print('Fuck 69');
                  },
                ),
                alignment: Alignment.topRight,
              ),
            ),
          ),
          Container(
              height: 150,
              //alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: 20, horizontal: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Contact:",
                        style: TextStyle(fontSize: Constants.fontSize3),
                      ),
                      Text(
                        ""
                        "+923040206774",
                        style: TextStyle(fontSize: Constants.fontSize4),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Email:",
                        style: TextStyle(fontSize: Constants.fontSize3),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            ""
                            "abc@gmail.com",
                            style: TextStyle(fontSize: Constants.fontSize4),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Constants.primaryColor,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext ctx) {
                                    return CustomDialogBox(
                                      titleText: "CHANGE EMAIL",
                                      oldText: "Old Email",
                                      newText: "New Email",
                                      confirmText: "Confirm Email",
                                      description:
                                          "Your Email has been updated Successfully!",
                                    );
                                  });
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Password:",
                        style: TextStyle(fontSize: Constants.fontSize3),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "********",
                            style: TextStyle(fontSize: Constants.fontSize4),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: 5),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.edit,
                              color: Constants.primaryColor,
                            ),
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext ctx) {
                                    return CustomDialogBox(
                                      titleText: "CHANGE PASSWORD",
                                      oldText: "Old Password",
                                      newText: "New Password",
                                      confirmText: "Confirm Password",
                                      description:
                                          "Your Password has been updated Successfully!",
                                    );
                                  });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ],
              )),
          Container(
              // margin:
              // EdgeInsets.only(top: 20.0, left: 50.0, right: 50.0, bottom: 0.0),
              // padding: EdgeInsets.symmetric(horizontal: 40),
              // child: SizedBox(
              //   height: 45,
              //   child: RaisedButton(
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: <Widget>[
              //         Icon(Icons.add_location),
              //         Text("Set Location"),
              //       ],
              //     ),
              //     shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(30.0),
              //       side: BorderSide(
              //         color: Constants.primaryColor,
              //         width: 2.5,
              //       ),
              //     ),
              //     color: Constants.primaryColor,
              //     textColor: Constants.secondaryColor,
              //     onPressed: () {},
              //   ),
              // ),
              ),
        ],
      )),
    );
  }
}
