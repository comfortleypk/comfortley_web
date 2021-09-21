import 'package:comfortley_web/Screens/Favourites/favourite.dart';
import 'package:comfortley_web/Screens/ServiceProvider/AboutAndReviews/body.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import '../../../constants.dart';

class ServiceProviderMainPageCard extends StatefulWidget {
  final String? serviceProviderName;
  final String? numberOfReviews;
  final num? rating;
  final String? address;
  final String? averageDeliveryTime;
  final int? price;
  final String? paymentAccepted;

  ServiceProviderMainPageCard({
    this.serviceProviderName,
    this.numberOfReviews,
    this.rating,
    this.address,
    this.averageDeliveryTime,
    this.price,
    this.paymentAccepted,
  });

  @override
  _ServiceProviderMainPageCardState createState() =>
      _ServiceProviderMainPageCardState();
}

class _ServiceProviderMainPageCardState
    extends State<ServiceProviderMainPageCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Constants.secondaryColor,
        boxShadow: [
          BoxShadow(
            color: Constants.shadeColor,
            offset: Offset(0, 5),
            blurRadius: 10,
          ),
        ],
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(30),
          bottomLeft: Radius.circular(30),
        ),
      ),
      height: 300,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            alignment: Alignment.topRight,
            padding: EdgeInsets.only(top: 10, right: 10),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/meal.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(
                      FluentIcons.info_24_regular,
                      color: Constants.primaryColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ServiceProviderAboutAndReviews();
                          },
                        ),
                      );
                    },
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            widget.serviceProviderName!,
                            style: TextStyle(
                                fontSize: Constants.fontSize3,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.star,
                            size: 20,
                            color: Constants.ratingIconColor,
                          ),
                          Text(
                            '${widget.rating} ( ${widget.numberOfReviews} )',
                            style: TextStyle(fontSize: Constants.fontSize5),
                          ),
                        ],
                      ),
                      Text(
                        widget.address!,
                        style: TextStyle(
                          fontSize: Constants.fontSize6,
                          color: Constants.textColor1,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: IconButton(
                    icon: Icon(
                      Icons.favorite_border,
                      color: Constants.primaryColor,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return FavouriteServiceProviders();
                          },
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                        "AVG Del Time:",
                        style: TextStyle(
                            fontSize: Constants.fontSize5,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.averageDeliveryTime!,
                        style: TextStyle(fontSize: Constants.fontSize6),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                        "Min Order:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.price.toString(),
                        style: TextStyle(fontSize: Constants.fontSize6),
                      )
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Text(
                        "Payment:",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        widget.paymentAccepted!,
                        style: TextStyle(fontSize: Constants.fontSize6),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
