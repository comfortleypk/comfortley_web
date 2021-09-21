import 'package:comfortley_web/Models/button.dart';
import 'package:comfortley_web/Models/completion_alert_box.dart';
import 'package:comfortley_web/Models/drawer.dart';
import 'package:comfortley_web/Screens/CartCurrentLocation/cart_current_location.dart';
import 'package:comfortley_web/Screens/HomePage/home_page.dart';
import 'package:comfortley_web/Screens/Profile/body.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';

class FeedbackPage extends StatefulWidget {
  @override
  State createState() => _FeedbackPageState();
}

enum FeedbackOptions { like_something, dont_like_something, suggestions }

class _FeedbackPageState extends State<FeedbackPage> {
  bool likeSomething = true;
  bool dontLikeSomething = false;
  bool suggestion = false;

  FeedbackOptions? option = FeedbackOptions.like_something;

  iLikeSomething() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
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
              labelText: 'Hey! We care about what you like or not!',
              alignLabelWithHint: true,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.all(15),
          height: 145,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Constants.shadeColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_upload_outlined,
                size: 70,
                color: Constants.primaryColor,
              ),
              Text(
                'Upload a screenshot of what you love!',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: Constants.fontSize3,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

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
            'Comfortley',
            style: TextStyle(
              color: Constants.primaryColor,
              fontSize: Constants.fontSize1,
            ),
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, left: 15),
                child: Text(
                  'Feedback',
                  style: TextStyle(
                    fontSize: Constants.fontSize1,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  'I like Something',
                  style: TextStyle(
                    fontSize: Constants.fontSize4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: FeedbackOptions.like_something,
                  groupValue: option,
                  onChanged: (FeedbackOptions? value) {
                    setState(() {
                      option = value;
                      likeSomething = true;
                      dontLikeSomething = false;
                      suggestion = false;
                    });
                  },
                ),
              ),
              if (likeSomething) iLikeSomething(),
              ListTile(
                title: Text(
                  'I don\'t like Something',
                  style: TextStyle(
                    fontSize: Constants.fontSize4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: FeedbackOptions.dont_like_something,
                  groupValue: option,
                  onChanged: (FeedbackOptions? value) {
                    setState(() {
                      option = value;
                      likeSomething = false;
                      dontLikeSomething = true;
                      suggestion = false;
                    });
                  },
                ),
              ),
              if (dontLikeSomething) iLikeSomething(),
              ListTile(
                title: Text(
                  'I have Suggestions',
                  style: TextStyle(
                    fontSize: Constants.fontSize4,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                leading: Radio(
                  value: FeedbackOptions.suggestions,
                  groupValue: option,
                  onChanged: (FeedbackOptions? value) {
                    setState(() {
                      option = value;
                      likeSomething = false;
                      dontLikeSomething = false;
                      suggestion = true;
                    });
                  },
                ),
              ),
              if (suggestion) iLikeSomething(),
              Container(
                margin: EdgeInsets.only(right: 200, left: 10),
                child: CustomButton(
                  iconName: Icons.send,
                  text: 'Submit',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext ctx) {
                        return CompletionAlertBox(
                          description:
                              "For your feedback, We will try to improve our services.",
                          iconName: Icons.arrow_back,
                          buttonText: "Back",
                          title: 'Thank You!',
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return HomePage();
                                },
                              ),
                            );
                          },
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
