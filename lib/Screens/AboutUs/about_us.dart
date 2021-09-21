import 'package:comfortley_web/Models/button.dart';
import 'package:comfortley_web/Models/drawer.dart';
import 'package:comfortley_web/Screens/CartCurrentLocation/cart_current_location.dart';
import 'package:comfortley_web/Screens/HomePage/home_page.dart';
import 'package:comfortley_web/Screens/Profile/body.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';

class AboutUs extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Constants.primaryColor, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Constants.secondaryColor,
      appBar: AppBar(
        backgroundColor: Constants.secondaryColor,
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Icon(
            Icons.dehaze,
            color: Constants.primaryColor,
          ),
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
                color: Constants.primaryColor, fontSize: Constants.fontSize1),
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
      body: AboutBody(),
    );
  }
}

class AboutBody extends StatefulWidget {
  @override
  _AboutBodyState createState() => _AboutBodyState();
}

class _AboutBodyState extends State<AboutBody> {

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Constants.primaryColor, //or set color with: Color(0xFF0000FF)
    ));
    return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20,left: 15),
              child: Text(
                'About us',
                style: TextStyle(
                  fontSize: Constants.fontSize1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25,left: 15),
              child: Text(
                'History',
                style: TextStyle(
                  fontSize: Constants.fontSize2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25,right: 25,top: 25),
              child: Text(
                Constants.dummyText,
                style: TextStyle(
                  fontSize: Constants.fontSize4,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25,left: 15),
              child: Text(
                'Comfortley',
                style: TextStyle(
                  fontSize: Constants.fontSize2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25,right: 25,top: 25),
              child: Text(
                Constants.dummyText,
                style: TextStyle(
                  fontSize: Constants.fontSize4,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 25,left: 15),
              child: Text(
                'Coverage',
                style: TextStyle(
                  fontSize: Constants.fontSize2,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 25,right: 25,top: 25),
              child: Text(
                Constants.dummyText,
                style: TextStyle(
                  fontSize: Constants.fontSize4,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              alignment: Alignment.bottomCenter,
              child: Column(
                children: [
                  Text(
                    'Want to know more?',
                    style: TextStyle(
                      fontSize: Constants.fontSize4,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  CustomButton(
                    iconName: FluentIcons.question_circle_24_regular,
                    text: "FAQs",
                    margin: 10,
                    padding: 80,
                    onPressed: (){
                      //Navigator.pop(context);
                    },
                  ),
                  // CustomButton(
                  //   text: 'FAQ',
                  //   onPressed: () {
                  //     print('FAQ pressed');
                  //   },
                  // ),
                ],
              ),
            ),
          ],
        ),
      );
  }
}
