import 'package:comfortley_web/Models/drawer.dart';
import 'package:comfortley_web/Screens/CartCurrentLocation/cart_current_location.dart';
import 'package:comfortley_web/Screens/HomePage/home_page.dart';
import 'package:comfortley_web/Screens/Profile/body.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';

class FavouriteServiceProviders extends StatefulWidget {
  @override
  _FavouriteServiceProvidersState createState() =>
      _FavouriteServiceProvidersState();
}

class _FavouriteServiceProvidersState extends State<FavouriteServiceProviders>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor:
            Constants.primaryColor, //or set color with: Color(0xFF0000FF)
      ),
    );
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return HomePage();
                }),
              );
            },
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
        body: Column(// Column
            children: <Widget>[
          Container(
            color: Constants.secondaryColor,
            padding: EdgeInsets.only(
              top: 10,
              left: 50,
              right: 50,
            ),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                  color: Constants.shadeColor,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              child: TabBar(
                controller: _tabController,
                unselectedLabelColor: Constants.secondaryColor,
                labelColor: Constants.secondaryColor,
                indicatorWeight: 2,
                indicator: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  color: Constants.primaryColor,
                ),
                tabs: <Widget>[
                  Tab(
                      child: Row(
                    children: [
                      IconButton(
                          icon: Icon(
                            Icons.delivery_dining,
                            size: 30,
                          ),
                          onPressed: null),
                      Text(
                        "Delivery",
                        style: TextStyle(
                          fontSize: Constants.fontSize4,
                        ),
                      ),
                    ],
                  )),
                  Tab(
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.dinner_dining,
                            size: 30,
                          ),
                          onPressed: null,
                        ),
                        Text(
                          "Pickup",
                          style: TextStyle(
                            fontSize: Constants.fontSize4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 20, left: 15),
            color: Constants.secondaryColor,
            width: double.infinity,
            child: Text(
              "Favourites",
              style: TextStyle(
                fontSize: Constants.fontSize1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    // ServiceProviderCardForVerticalSlider(
                    //     serviceProviderName: "SP Name",
                    //     numberOfReviews: "1k",
                    //     rating: 4.2),
                    // ServiceProviderCardForVerticalSlider(
                    //     serviceProviderName: "SP Name",
                    //     numberOfReviews: "1k",
                    //     rating: 4.2),
                    // ServiceProviderCardForVerticalSlider(
                    //     serviceProviderName: "SP Name",
                    //     numberOfReviews: "1k",
                    //     rating: 4.2),
                    // ServiceProviderCardForVerticalSlider(
                    //     serviceProviderName: "SP Name",
                    //     numberOfReviews: "1k",
                    //     rating: 4.2),
                  ],
                ),
                ListView(
                  children: <Widget>[
                    // ServiceProviderCardForVerticalSlider(
                    //     serviceProviderName: "SP Name",
                    //     numberOfReviews: "1k",
                    //     rating: 4.2),
                    // ServiceProviderCardForVerticalSlider(
                    //     serviceProviderName: "SP Name",
                    //     numberOfReviews: "1k",
                    //     rating: 4.2),
                    // ServiceProviderCardForVerticalSlider(
                    //     serviceProviderName: "SP Name",
                    //     numberOfReviews: "1k",
                    //     rating: 4.2),
                    // ServiceProviderCardForVerticalSlider(
                    //     serviceProviderName: "SP Name",
                    //     numberOfReviews: "1k",
                    //     rating: 4.2),
                  ],
                )
              ],
            ),
          )
        ]));
  }
}
