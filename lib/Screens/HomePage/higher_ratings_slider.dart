import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comfortley_web/Models/card.dart';
import 'package:comfortley_web/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HigherRatingsSlider extends StatelessWidget {
  final String? title;
  Stream<QuerySnapshot> highestRated =
      FirebaseFirestore.instance.collection('Restaurants').snapshots();

  HigherRatingsSlider({
    this.title,
  });

  getRestaurants(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data!.docs.map((doc) {
      return (doc.get('highRated'))
          ? ServiceProviderCardForHorizontalSlider(
              serviceProviderName: doc.get('name'),
              numberOfReviews: doc.get('numberOfReviews').toString(),
              rating: doc.get('rating'),
              document: doc,
            )
          : Container();
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      padding: EdgeInsets.only(top: 10),
      height: 211.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 10),
            width: double.infinity,
            child: Text(
              title.toString(),
              style: TextStyle(
                fontSize: Constants.fontSize1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // SizedBox(
          //   height: 170,
          //   child: StreamBuilder<QuerySnapshot>(
          //     stream: mostRatings,
          //     builder: (BuildContext context,
          //         AsyncSnapshot<QuerySnapshot> snapshot) {
          //       if (!snapshot.hasData) {
          //         return Center(child: CircularProgressIndicator());
          //       } else {
          //         return new ListView(
          //           scrollDirection: Axis.horizontal,
          //           children: getRestaurants(snapshot),
          //         );
          //       }
          //     },
          //   ),
          // ),
          SizedBox(
            height: 170,
            child: StreamBuilder<QuerySnapshot>(
              stream: highestRated,
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return ListView(
                    scrollDirection: Axis.horizontal,
                    children: getRestaurants(snapshot),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
