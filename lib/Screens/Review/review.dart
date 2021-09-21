import 'package:comfortley_web/Models/button.dart';
import 'package:comfortley_web/Models/completion_alert_box.dart';
import 'package:comfortley_web/Models/drawer.dart';
import 'package:comfortley_web/Models/share.dart';
import 'package:comfortley_web/Screens/CartCurrentLocation/cart_current_location.dart';
import 'package:comfortley_web/Screens/HomePage/home_page.dart';
import 'package:comfortley_web/Screens/Profile/body.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import '../../constants.dart';

// ignore: must_be_immutable
class Review extends StatelessWidget {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

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
          onTap: (){
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return HomePage();
                },),);
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
      body: ReviewBody(),
    );
  }
}

class ReviewBody extends StatefulWidget {
  @override
  _ReviewBodyState createState() => _ReviewBodyState();
}

class _ReviewBodyState extends State<ReviewBody> {
  double rating = 0.0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 15),
              child: Text(
                'Add a Review',
                style: TextStyle(
                  fontSize: Constants.fontSize1,
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
                  fontSize: Constants.fontSize5,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 35),
              child: Text(
                'Your order has been completed! Please take some time to rate the restaurant and write a meaningful review.',
                style: TextStyle(
                  fontSize: Constants.fontSize5,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Center(
                child: SmoothStarRating(
                    allowHalfRating: true,
                    onRated: (v) {},
                    starCount: 5,
                    rating: rating,
                    size: 60.0,
                    isReadOnly: false,
                    color: Constants.primaryColor,
                    borderColor: Constants.primaryColor,
                    spacing: 1.0,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, left: 15, right: 15),
              child: TextFormField(
                maxLines: 7,
                minLines: 5,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  focusColor: Constants.primaryColor,
                  labelText: 'Please write a review...',
                  alignLabelWithHint: true,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, top: 30),
              child: Row(
                children: [
                  CustomButton(
                    iconName: Icons.check,
                    text: 'Submit Review',
                    onPressed: () {
                      showDialog(
                          context: context,
                          builder: (BuildContext ctx) {
                            return CompletionAlertBox(
                              description:
                                  "Your review means a lot to us, It will surely help others.",
                              iconName: Icons.arrow_back,
                              buttonText: "Back",
                              title: 'Thank You!',
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (BuildContext context) {
                                      return HomePage();
                                    },),);
                              },
                            );
                          },);
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        backgroundColor: MaterialStateProperty.all(
                          Constants.primaryColor,
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (BuildContext context) {
                              return ShareOnSocialSites();
                            },),);
                      },
                      child: Row(
                        children: [
                          Icon(
                            FluentIcons.share_24_regular,
                            color: Constants.primaryColor,
                          ),
                          Text(
                            'Share',
                            style: TextStyle(
                              color: Constants.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
