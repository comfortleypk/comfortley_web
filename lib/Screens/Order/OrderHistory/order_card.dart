import 'package:comfortley_web/Models/button.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class OrderCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 10),
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Constants.secondaryColor,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Constants.shadeColor,
              offset: Offset(0, 5),
              blurRadius: 10,
            ),
          ]),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mega Deal 1",
                      style: TextStyle(
                          fontSize: Constants.fontSize4,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Address of Service provider",
                      style: TextStyle(
                          color: Constants.textColor1,
                          fontSize: Constants.fontSize6),
                    )
                  ],
                ),
                Text(
                  "Rs.399",
                  style: TextStyle(
                      fontSize: Constants.fontSize3,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "28 Jan, 2021 12:30 PM",
                  style: TextStyle(fontSize: Constants.fontSize5),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 10, right: 10),
                  alignment: Alignment.center,
                  height: 45,
                  margin: EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: CustomButton(
                    iconName: Icons.wifi_protected_setup,
                    text: "Reorder",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
