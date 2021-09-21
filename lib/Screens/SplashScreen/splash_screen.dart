import 'dart:async';
import 'dart:io';

import 'package:comfortley_web/Screens/HomePage/home_page.dart';
import 'package:comfortley_web/Screens/Login/login.dart';
import 'package:comfortley_web/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 5),
      () {
        if (FirebaseAuth.instance.currentUser != null) {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return HomePage();
          }));
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (BuildContext context) {
            return Login();
          }));
        }
        // try {
        //   final result = await InternetAddress.lookup('google.com');
        //   if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        //     print('Connected');
        //
        //   }
        // } on SocketException catch (_) {
        //   print('Not Connected!');
        //   showDialog(
        //       context: context,
        //       builder: (BuildContext context) {
        //         return AlertDialog(
        //           title: Text(
        //             'Error: No Internet!',
        //             style: TextStyle(
        //               color: Constants.primaryColor,
        //             ),
        //           ),
        //           content: Text('Please connect to a network to use our app!'),
        //           actions: [
        //             TextButton(
        //               child: Text(
        //                 'Exit',
        //                 style: TextStyle(
        //                   color: Constants.primaryColor,
        //                 ),
        //               ),
        //               onPressed: () {
        //                 SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        //               },
        //             ),
        //           ],
        //         );
        //       }
        //   );
        // }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Icon(
              Icons.shop,
              size: 50,
              color: Constants.secondaryColor,
            ),
          ),
          Text(
            "COMFORTLEY",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
                color: Constants.secondaryColor,
                letterSpacing: 2.5),
          )
        ],
      ),
    );
  }
}
