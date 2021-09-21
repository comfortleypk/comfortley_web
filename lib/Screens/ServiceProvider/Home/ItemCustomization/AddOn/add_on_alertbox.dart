import 'package:comfortley_web/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddOnItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Constants.secondaryColor,
        // border: Border.all(
        //   color: Constants.primaryColor,                  ),
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              margin: EdgeInsets.only(left: 10),
              child: Text(
                "Fries",
                style: TextStyle(
                  fontSize: Constants.fontSize6,
                ),
              )),
          Row(
            children: [
              Icon(
                Icons.check,
                color: Constants.primaryColor,
              ),
              Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Text(
                    "Rs. 100/-",
                    style: TextStyle(
                      fontSize: Constants.fontSize6,
                    ),
                  )),
            ],
          ),
        ],
      ),
    );
  }
}
