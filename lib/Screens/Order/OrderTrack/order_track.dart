import 'package:comfortley_web/Models/drawer.dart';
import 'package:comfortley_web/Screens/CartCurrentLocation/cart_current_location.dart';
import 'package:comfortley_web/Screens/HomePage/home_page.dart';
import 'package:comfortley_web/Screens/Profile/body.dart';
import 'package:comfortley_web/Screens/Review/review.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../constants.dart';

// ignore: must_be_immutable
class OrderTrack extends StatelessWidget {
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Constants.primaryColor, //or set color with: Color(0xFF0000FF)
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
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return HomePage();
                },
              ),
            );
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Cart();
                  },
                ),
              );
            },
          ),
          IconButton(
            tooltip: "User Profile",
            icon: Icon(
              FluentIcons.person_24_regular,
              color: Constants.primaryColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Profile();
                  },
                ),
              );
            },
          ),
        ],
      ),
      drawer: CustomDrawer.drawer(context),
      body: OrderTrackBody(),
    );
  }
}

class OrderTrackBody extends StatefulWidget {
  @override
  _OrderTrackBodyState createState() => _OrderTrackBodyState();
}

class _OrderTrackBodyState extends State<OrderTrackBody> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 15),
                    child: Text(
                      'Track Order',
                      style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, left: 15),
                    child: Text(
                      'The order has been placed.',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 15, right: 15),
                    child: Icon(
                      EvaIcons.clockOutline,
                      size: 35,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10, right: 15),
                    child: Text(
                      '20 Minutes',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 35),
            child: Text(
              'Rider is on the way, will deliver in 20 minutes',
              style: TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            // margin: EdgeInsets.only(top: 35),
            child: Icon(
              EvaIcons.arrowDown,
              size: 65,
              color: Constants.primaryColor,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Image.asset(
                    'images/meal_being_prepared.png',
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  child: Image.asset(
                    'images/on_the_way.png',
                  ),
                ),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return Review();
                        },
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 15),
                    child: Image.asset(
                      'images/delivered.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
