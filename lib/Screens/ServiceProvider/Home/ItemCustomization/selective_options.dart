import 'package:comfortley_web/constants.dart';
import 'package:flutter/material.dart';

import 'AddOn/add_on_options.dart';

class Option extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
          color: Constants.secondaryColor,
          boxShadow: [
            BoxShadow(
              color: Constants.shadeColor,
              offset: Offset(0, 5),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      margin: EdgeInsets.symmetric(vertical: 5),
      padding: EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                child: Text(
                  "Soft Drink",
                  style: TextStyle(fontSize: Constants.fontSize6),
                ),
              ),
              TextButton(
                child: Text(
                  "Choose",
                  style: TextStyle(
                    fontSize: Constants.fontSize5,
                    color: Constants.primaryColor,
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AddOnOptionAlertBox();
                      }
                  );
                },
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            child: Text(
              "Required",
              style: TextStyle(
                fontSize: Constants.fontSize6, color: Constants.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
