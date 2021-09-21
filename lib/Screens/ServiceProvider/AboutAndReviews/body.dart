import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comfortley_web/Models/share.dart';
import 'package:comfortley_web/Screens/CartCurrentLocation/cart_current_location.dart';
import 'package:comfortley_web/Screens/Profile/body.dart';
import 'package:comfortley_web/Screens/ServiceProvider/AboutAndReviews/reviews.dart';
import 'package:comfortley_web/constants.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'about.dart';

class ServiceProviderAboutAndReviews extends StatefulWidget {
  final QueryDocumentSnapshot? doc;

  const ServiceProviderAboutAndReviews({
    Key? key,
    this.doc,
  }) : super(key: key);

  @override
  _ServiceProviderAboutAndReviewsState createState() =>
      _ServiceProviderAboutAndReviewsState();
}

class _ServiceProviderAboutAndReviewsState
    extends State<ServiceProviderAboutAndReviews>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Constants.primaryColor, //or set color with: Color(0xFF0000FF)
    ));
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
            onPressed: () {
              // Navigator.push(context,
              //     MaterialPageRoute(builder: (BuildContext context) {
              //       return ServiceProviderHome();
              //     }));
            },
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                FluentIcons.share_24_regular,
                color: Constants.primaryColor,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ShareOnSocialSites();
                    });
              },
            ),
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
                }));
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
                }));
              },
            ),
          ],
        ),
        body: Column(// Column
            children: <Widget>[
          // ServiceProviderMainPageCard(
          //     serviceProviderName: "SP Name",
          //     numberOfReviews: "5k",
          //     rating: 4.2,
          //     address: "Gulistanejohar, karachi",
          //     averageDeliveryTime: "30mints",
          //     price: 250,
          //     paymentAccepted: "cash/card"),
          Container(
            height: 60,
            margin: EdgeInsets.only(top: 5.0),
            color: Constants.secondaryColor,
            padding: EdgeInsets.only(top: 10, left: 10, right: 10),
            width: double.infinity,
            alignment: Alignment.center,
            child: TabBar(
              isScrollable: true,
              controller: _tabController,
              unselectedLabelColor: Constants.primaryColor,
              labelColor: Constants.secondaryColor,
              indicatorWeight: 2,
              indicator: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  color: Constants.primaryColor),
              tabs: <Widget>[
                Tab(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(FluentIcons.info_24_regular),
                        onPressed: () {
                          print('Fuck 69');
                        },
                      ),
                      Text("About")
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(FluentIcons.comment_24_regular),
                        onPressed: () {
                          print('Fuck 69');
                        },
                      ),
                      Text("Reviews")
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                AboutServiceProvider(
                  address: widget.doc!.get('address'),
                ),
                ServiceProviderReviews(),
              ],
            ),
          )
        ]));
  }
}
