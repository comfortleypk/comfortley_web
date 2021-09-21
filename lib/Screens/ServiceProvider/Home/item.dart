import 'package:comfortley_web/constants.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'ItemCustomization/item_customization_alertbox.dart';

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      padding: EdgeInsets.all(15.0),
      width: double.infinity,
      height: 140,
      decoration: BoxDecoration(
          color: Constants.secondaryColor,
          boxShadow: [
            BoxShadow(
              color: Constants.shadeColor,
              offset: Offset(0, 5),
              blurRadius: 20,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Mega Deal",
                    style: TextStyle(
                      fontSize: Constants.fontSize4,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Rs. 350",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: Constants.fontSize3,
                    ),
                  ),
                ],
              ),
              Text(
                "1 Chiken tikka leg, Seekh Reshmi Kabba 2"
                " Paratha with Salad & Chatani",
                style: TextStyle(
                  fontSize: Constants.fontSize5,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return ItemCustomization();
                        },
                      );
                    },
                    child: Text(
                      "Customization Available",
                      style: TextStyle(
                        fontSize: Constants.fontSize5,
                        color: Constants.primaryColor,
                      ),
                    ),
                  ),
                  Container(
                    width: 125,
                    height: 45,
                    padding: EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: Constants.shadeColor,
                      borderRadius: BorderRadius.all(
                        Radius.circular(30.0),
                      ),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 40,
                          child: Icon(
                            FluentIcons.subtract_24_regular,
                            size: 20,
                            color: Constants.primaryColor,
                          ),
                        ),
                        Container(
                          color: Constants.secondaryColor,
                          width: 40,
                          alignment: Alignment.center,
                          child: Text(
                            "5",
                            style: TextStyle(fontSize: Constants.fontSize3),
                          ),
                        ),
                        SizedBox(
                          width: 40,
                          child: Icon(
                            FluentIcons.add_24_regular,
                            size: 20,
                            color: Constants.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
