import 'package:comfortley_web/Models/button.dart';
import 'package:comfortley_web/Screens/HomePage/home_page.dart';
import 'package:comfortley_web/Screens/PaymentMethod/payment_method.dart';
import 'package:comfortley_web/Screens/Profile/body.dart';
import 'package:comfortley_web/Screens/SetLocation/set_location.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants.dart';
import 'item_card.dart';

class Cart extends StatelessWidget {
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
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return HomePage();
            }));
          },
        ),
        title: InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (BuildContext context) {
              return HomePage();
            }));
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
      body: CartBody(),
    );
  }
}

class CartBody extends StatefulWidget {
  @override
  _CartBodyState createState() => _CartBodyState();
}

class _CartBodyState extends State<CartBody> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20, left: 15),
          child: Text(
            'Cart',
            style: TextStyle(
              fontSize: Constants.fontSize1,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 5,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Constants.secondaryColor,
            boxShadow: [
              BoxShadow(
                  color: Constants.shadeColor,
                  offset: Offset(0, 5),
                  blurRadius: 10),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: ListTile(
                      title: Text(
                        'Eren Yeager',
                        style: TextStyle(
                          fontSize: Constants.fontSize3,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Container(
                        margin: EdgeInsets.only(top: 5.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              '03472902627',
                              style: TextStyle(
                                  fontSize: Constants.fontSize4,
                                  color: Colors.black),
                            ),
                            Text(
                              'ereh@freedom.com',
                              style: TextStyle(
                                  fontSize: Constants.fontSize4,
                                  color: Colors.black),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return Profile();
                          }));
                        },
                        child: CircleAvatar(
                          radius: 50,
                          backgroundColor: Constants.secondaryColor,
                          child: CircleAvatar(
                            radius: 45,
                            backgroundImage: NetworkImage(
                                'https://static.wikia.nocookie.net/shingekinokyojin/images/a/a1/Eren_Jaeger_%28Anime%29_character_image.png/revision/latest?cb=20201227235515'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
          // color: Constants.secondaryColor,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          //color: Colors.white, // Tab Bar color change
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Constants.secondaryColor,
              boxShadow: [
                BoxShadow(
                    color: Constants.shadeColor,
                    offset: Offset(0, 5),
                    blurRadius: 10),
              ],
              // border: Border.all(
              //   color: Colors.black12,                  ),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: ListTile(
                        title: Text(
                          'Delivery Details',
                          style: TextStyle(
                              fontSize: Constants.fontSize3,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        subtitle: Row(
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Row(
                                                  children: [
                                                    Text(
                                                      'Safoora Chowrangi, Khi.',
                                                      style: TextStyle(
                                                          fontSize: Constants
                                                              .fontSize5,
                                                          color: Colors.black),
                                                    ),
                                                    TextButton(
                                                      onPressed: () {
                                                        Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (BuildContext
                                                                    context) {
                                                              return SetLocation();
                                                            },
                                                          ),
                                                        );
                                                      },
                                                      child: Text(
                                                        'Change',
                                                        style: TextStyle(
                                                          fontSize: Constants
                                                              .fontSize5,
                                                          color: Constants
                                                              .primaryColor,
                                                          decoration:
                                                              TextDecoration
                                                                  .underline,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.gps_fixed_rounded,
                                                    size: 30,
                                                    color:
                                                        Constants.primaryColor,
                                                  ),
                                                  onPressed: () {
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (BuildContext
                                                            context) {
                                                          return SetLocation();
                                                        },
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ],
                                            ),
                                            Text(
                                              'Delivery Time',
                                              style: TextStyle(
                                                fontSize: Constants.fontSize5,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 10.0,
                                    ),
                                    Text(
                                      'Payment Methods',
                                      style: TextStyle(
                                        fontSize: Constants.fontSize3,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Default Payment Method',
                                          style: TextStyle(
                                              fontSize: Constants.fontSize5,
                                              color: Colors.black),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) {
                                                  return PaymentMethod();
                                                },
                                              ),
                                            );
                                          },
                                          child: Text(
                                            'Change',
                                            style: TextStyle(
                                              fontSize: Constants.fontSize5,
                                              color: Constants.primaryColor,
                                              decoration:
                                                  TextDecoration.underline,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
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
                  blurRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(10.0),
              ),
            ),
            child: Column(
              children: [
                ItemCard(),
                ItemCard(),
                ItemCard(),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Sub Total",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Constants.fontSize4,
                        ),
                      ),
                      Text(
                        "Rs. 1299",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: Constants.fontSize4,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
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
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Constants.fontSize4,),
                      ),
                      Text(
                        "Rs. 1399",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: Constants.fontSize4,),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        CustomButton(
          margin: 5,
          padding: 80,
          iconName: Icons.check,
          text: 'Place Order',
          onPressed: () {
            // TODO implement Navigator
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (BuildContext context) {
            //       print("jello");
            //     }));
          },
        ),
      ],
    );
  }
}
