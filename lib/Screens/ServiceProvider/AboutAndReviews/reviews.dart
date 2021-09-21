import 'package:comfortley_web/Screens/ServiceProvider/AboutAndReviews/review_card.dart';
import 'package:flutter/material.dart';

class ServiceProviderReviews extends StatefulWidget {
  @override
  _ServiceProviderReviewsState createState() => _ServiceProviderReviewsState();
}

class _ServiceProviderReviewsState extends State<ServiceProviderReviews> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Constants.shadeColor,
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10,left: 10,right: 10),
            child: ReviewCard()
          ),
          Container(
            margin: EdgeInsets.only(top: 10,left: 10,right: 10),
            child: ReviewCard()
          ),
          Container(
            margin: EdgeInsets.only(top: 10,left: 10,right: 10),
            child: ReviewCard()
          ),
          Container(
            margin: EdgeInsets.only(top: 10,left: 10,right: 10),
            child: ReviewCard()
          ),
          Container(
            margin: EdgeInsets.only(top: 10,left: 10,right: 10),
            child: ReviewCard()
          ),
        ],
      ),
    );
  }
}
