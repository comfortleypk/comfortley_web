import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Constants.secondaryColor,
        padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
        //margin: EdgeInsets.only(bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  width: 125,
                  height: 45,
                  padding: EdgeInsets.only(right: 5),
                  decoration: BoxDecoration(
                      color: Constants.shadeColor,
                      // boxShadow: [
                      //   BoxShadow(color: Constants.shadeColor,offset: Offset(0,5),
                      //     blurRadius: 20,
                      //   ),
                      // ],
                      // border: Border.all(
                      //   color: Colors.black12,                  ),
                      borderRadius: BorderRadius.all(Radius.circular(30.0))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                          width: 40,
                          //color: Constants.shadeColor,
                          child: Icon(
                            FluentIcons.subtract_24_regular,
                            size: 20,
                            color: Constants.primaryColor,
                          )),
                      Container(
                          color: Constants.secondaryColor,
                          width: 40,
                          alignment: Alignment.center,
                          child: Text(
                            "5",
                            style: TextStyle(fontSize: Constants.fontSize3),
                          )),
                      Container(
                          width: 40,
                          //color: Constants.shadeColor,
                          child: Icon(
                            FluentIcons.add_24_regular,
                            size: 20,
                            color: Constants.primaryColor,
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  "Zinger Burger",
                  style: TextStyle(fontSize: Constants.fontSize4),
                )
              ],
            ),
            Text(
              "Rs. 399",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: Constants.fontSize3),
            ),
          ],
        ));
  }
}
