import 'package:comfortley_web/Models/share.dart';
import 'package:comfortley_web/Screens/CartCurrentLocation/cart_current_location.dart';
import 'package:comfortley_web/Screens/HomePage/home_page.dart';
import 'package:comfortley_web/Screens/Profile/body.dart';
import 'package:comfortley_web/Screens/ServiceProvider/Home/items_list.dart';
import 'package:comfortley_web/Screens/ServiceProvider/Home/service_provider_main_page_card.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../constants.dart';

class ServiceProviderHome extends StatefulWidget {
  @override
  _ServiceProviderHomeState createState() => _ServiceProviderHomeState();
}

class _ServiceProviderHomeState extends State<ServiceProviderHome>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 7, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Constants.primaryColor, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      //backgroundColor: Constants.secondaryColor,
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
                },
              );
            },
          ),
          IconButton(
            tooltip: "Food Cart",
            icon: Icon(
              FluentIcons.cart_24_regular,
              color: Constants.primaryColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (BuildContext context) {
                  return Cart();
                }),
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
                MaterialPageRoute(builder: (BuildContext context) {
                  return Profile();
                }),
              );
            },
          ),
        ],
      ),
      body: Column(
        // Column
        children: <Widget>[
          ServiceProviderMainPageCard(
              serviceProviderName: "SP Name",
              numberOfReviews: "5k",
              rating: 4.2,
              address: "Gulistanejohar, karachi",
              averageDeliveryTime: "30mints",
              price: 250,
              paymentAccepted: "cash/card"),
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
              indicatorWeight: 7,
              indicator: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  color: Constants.primaryColor),
              tabs: <Widget>[
                Tab(
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.delivery_dining), onPressed: null),
                      Text("Delivery")
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.delivery_dining), onPressed: null),
                      Text("Delivery")
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.delivery_dining), onPressed: null),
                      Text("Delivery")
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.delivery_dining), onPressed: null),
                      Text("Delivery")
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.delivery_dining), onPressed: null),
                      Text("Delivery")
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.delivery_dining), onPressed: null),
                      Text("Delivery")
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    children: [
                      IconButton(
                          icon: Icon(Icons.delivery_dining), onPressed: null),
                      Text("Delivery")
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
                ItemsList(),
                ItemsList(),
                ItemsList(),
                ItemsList(),
                ItemsList(),
                ItemsList(),
                ItemsList(),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty<TabController>('_tabController', _tabController));
  }
}
