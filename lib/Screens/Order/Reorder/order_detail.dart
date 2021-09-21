import 'package:comfortley_web/Models/button.dart';
import 'package:comfortley_web/Screens/CartCurrentLocation/cart_current_location.dart';
import 'package:comfortley_web/Screens/HomePage/home_page.dart';
import 'package:comfortley_web/Screens/Order/OrderHistory/body.dart';
import 'package:comfortley_web/Screens/Profile/body.dart';
import 'package:comfortley_web/Screens/ServiceProvider/Home/service_provider_main_page_card.dart';
import 'package:comfortley_web/constants.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'item_card.dart';

class OrderDetails extends StatefulWidget {
  @override
  _OrderDetailsState createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (BuildContext context) {
                return OrderHistory();
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
      body: SingleChildScrollView(
        child: Column(
          // Column
          children: <Widget>[
            ServiceProviderMainPageCard(
              serviceProviderName: "SP Name",
              numberOfReviews: "5k",
              rating: 4.2,
              address: "Gulistanejohar, karachi",
              averageDeliveryTime: "30mints",
              price: 250,
              paymentAccepted: "cash/card",
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              width: double.infinity,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Constants.secondaryColor,
                  boxShadow: [
                    BoxShadow(
                        color: Constants.shadeColor,
                        offset: Offset(0, 5),
                        blurRadius: 10,),
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(20),),),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Order Details",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Constants.fontSize3,),
                      ),
                      CustomButton(
                        iconName: Icons.wifi_protected_setup,
                        text: "Reorder",
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return Cart();
                          },),);
                        },
                      )
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(
                            "Order Id:  ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Constants.fontSize4),
                          )),
                      Expanded(
                          flex: 7,
                          child: Text(
                            "#88",
                            style: TextStyle(fontSize: Constants.fontSize4),
                          ),),
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              "Location:  ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16),
                            )),
                        Expanded(
                          flex: 7,
                          child: SizedBox(
                            child: Text(
                              Constants.dummyText,
                              style: TextStyle(fontSize: Constants.fontSize4),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                          flex: 2,
                          child: Text(
                            "Status:  ",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),),
                      Expanded(
                          flex: 7,
                          child: Text(
                            "Completed",
                            style: TextStyle(fontSize: Constants.fontSize4),
                          ),),
                    ],
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
                padding: EdgeInsets.all(10.0),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Constants.secondaryColor,
                    boxShadow: [
                      BoxShadow(
                          color: Constants.shadeColor,
                          offset: Offset(0, 5),
                          blurRadius: 10,),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                child: Column(
                  children: [
                    ItemCard(),
                    ItemCard(),
                    ItemCard(),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Sub Total",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Constants.fontSize4),
                          ),
                          Text(
                            "Rs. 1299",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Constants.fontSize4),
                          )
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Delivery Charges",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Constants.fontSize3),
                          ),
                          Text(
                            "Rs. 30",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Constants.fontSize3),
                          )
                        ],
                      ),
                    ),
                    Container(
                      color: Constants.secondaryColor,
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Total",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Constants.fontSize4),
                          ),
                          Text(
                            "Rs. 1399",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: Constants.fontSize4),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
