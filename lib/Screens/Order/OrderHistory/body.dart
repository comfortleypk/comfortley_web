import 'package:comfortley_web/Models/drawer.dart';
import 'package:comfortley_web/Screens/CartCurrentLocation/cart_current_location.dart';
import 'package:comfortley_web/Screens/HomePage/home_page.dart';
import 'package:comfortley_web/Screens/Profile/body.dart';
import 'package:comfortley_web/constants.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'order_card.dart';
class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }
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
                  },),);
            },
            child: Text(
              "Comfortley",
              style: TextStyle(
                  color: Constants.primaryColor, fontSize: Constants.fontSize1,
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
        body: Column(// Column
            children: <Widget>[
              Container(
                  color: Constants.secondaryColor,
                  padding: EdgeInsets.only(top: 10,left: 50,right: 50,),
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
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
                          color: Constants.primaryColor
                      ),
                      tabs: <Widget>[
                        Tab(
                          text: "Delivery",
                        ),
                        Tab(
                          text: "Pickup",
                        ),
                      ],
                    ),
                  )
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 15),
                width: double.infinity,
                child: Text("Order History",
                  style: TextStyle(
                    fontSize: Constants.fontSize1,
                    fontWeight: FontWeight.bold,
                  ),),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: <Widget>[

                    ListView(
                      children: <Widget>[
                        OrderCard(),
                        OrderCard(),
                        OrderCard(),
                        OrderCard(),
                        OrderCard(),
                        OrderCard(),
                        OrderCard(),
                      ],
                    ),
                    ListView(
                      children: <Widget>[
                        OrderCard(),
                        OrderCard(),
                        OrderCard(),
                        OrderCard(),
                        OrderCard(),
                        OrderCard(),
                        OrderCard(),
                      ],
                    )
                  ],
                ),
              )
            ]));
  }
}
