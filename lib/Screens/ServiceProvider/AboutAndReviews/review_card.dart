import 'package:comfortley_web/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.0, horizontal: 10),
      padding: EdgeInsets.all(10.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Constants.secondaryColor,
        boxShadow: [
          BoxShadow(
            color: Constants.shadeColor,
            offset: Offset(0, 5),
            blurRadius: 20,
          ),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(10.0),
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(left: 5),
                  child: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    radius: 25,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      child: Image.asset(
                        "images/meal.jpg",
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  padding: EdgeInsets.only(left: 5),
                  margin: EdgeInsets.only(top: 20),
                  height: 50,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sagheer Ahmed",
                            style: TextStyle(
                              fontSize: Constants.fontSize5,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "28 Jan, 2021",
                            style: TextStyle(
                              fontSize: Constants.fontSize6,
                              color: Constants.textColor1,
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Constants.ratingIconColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Constants.ratingIconColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Constants.ratingIconColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Constants.ratingIconColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 15,
                              color: Constants.ratingIconColor,
                            ),
                            Text(
                              "4.5",
                              style: TextStyle(fontSize: Constants.fontSize6),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: SizedBox(),
              ),
              Expanded(
                flex: 8,
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Text(
                    Constants.dummyText,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
