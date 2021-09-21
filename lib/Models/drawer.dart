import 'package:comfortley_web/Screens/AboutUs/about_us.dart';
import 'package:comfortley_web/Screens/FAQ/faq.dart';
import 'package:comfortley_web/Screens/Feedback/body.dart';
import 'package:comfortley_web/Screens/Login/login.dart';
import 'package:comfortley_web/Screens/Order/OrderHistory/body.dart';
import 'package:comfortley_web/Screens/PaymentMethod/payment_method.dart';
import 'package:comfortley_web/Screens/SetLocation/set_location.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class CustomDrawer {
  static Widget drawer (BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(40),
            bottomRight: Radius.circular(40),
          ),
          color: Constants.secondaryColor,
        ),
        width: MediaQuery.of(context).size.width * 0.75,
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40, bottom: 40),
              child: Text(
                "COMFORTLEY",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32,
                  color: Constants.primaryColor,
                  letterSpacing: 2.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 30),
              child: Divider(
                thickness: 1.2,
              ),
            ),
            DrawerButton(
              buttonIcon: FluentIcons.location_24_regular,
              buttonText: 'Change Default Location',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return SetLocation();
                    }
                ));
              },
            ),
            DrawerButton(
              buttonIcon: FluentIcons.history_24_regular,
              buttonText: 'Order History',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return OrderHistory();
                    }
                ));
              },
            ),
            DrawerButton(
              buttonIcon: Icons.favorite_border,
              buttonText: 'Favourites',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return OrderHistory();
                    }
                ));
              },
            ),
            DrawerButton(
              buttonIcon: FluentIcons.person_feedback_24_regular,
              buttonText: 'Feedback',
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return FeedbackPage();
                    }
                ));
              },
            ),
            DrawerButton(
              buttonIcon: FluentIcons.star_24_regular,
              buttonText: 'Rate our App',
              onTap: () {
                print('Rate our App');
              },
            ),
            DrawerButton(
              buttonIcon: FluentIcons.payment_24_regular,
              buttonText: 'Payment Methods',
              onTap: () {
                print('Payment Methods');
                Navigator.push(context, MaterialPageRoute(
                  builder: (BuildContext context) {
                    return PaymentMethod();
                  }
                ));
              },
            ),
            DrawerButton(
              buttonIcon: FluentIcons.info_24_regular,
              buttonText: 'About us',
              onTap: () {
                print('About us');
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return AboutUs();
                    }
                ));
              },
            ),
            DrawerButton(
              buttonIcon: FluentIcons.question_circle_24_regular,
              buttonText: 'FAQs',
              onTap: () {
                print('FAQs');
                Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return FAQ();
                    }
                ));
              },
            ),
            DrawerButton(
              buttonIcon: FluentIcons.sign_out_24_regular,
              buttonText: 'Logout',
              onTap: () {
                print('Logout');
                FirebaseAuth.instance.signOut().then((value) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (BuildContext context) {
                      return Login();
                    }
                  ));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

class DrawerButton extends StatelessWidget {

  final String? buttonText;
  final IconData? buttonIcon;
  final Function()? onTap;

  const DrawerButton({
    this.buttonText,
    this.buttonIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(left: 5, top: 13),
        padding: EdgeInsets.symmetric(vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 2,
              child: Icon(
                buttonIcon,
                color: Colors.black,
                size: 30,
              ),
            ),
            Expanded(
                flex: 8,
                child: Text(
                  buttonText.toString(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}