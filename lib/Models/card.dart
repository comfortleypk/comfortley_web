import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comfortley_web/Screens/ServiceProvider/AboutAndReviews/body.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:paulonia_cache_image/paulonia_cache_image.dart';

import '../constants.dart';

class ServiceProviderCardForHorizontalSlider extends StatefulWidget {
  final String? serviceProviderName;
  final String? numberOfReviews;
  final num? rating;
  final QueryDocumentSnapshot? document;

  const ServiceProviderCardForHorizontalSlider(
      {this.serviceProviderName, this.numberOfReviews, this.rating,this.document});

  @override
  _ServiceProviderCardForHorizontalSliderState createState() => _ServiceProviderCardForHorizontalSliderState();
}

class _ServiceProviderCardForHorizontalSliderState extends State<ServiceProviderCardForHorizontalSlider> {
  String? imageURL;

  Future <void> getImage () async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('Restaurant Images')
        .child('${widget.document!.id}.jpg');
    String url = await ref.getDownloadURL();
    setState(() {
      imageURL = url.toString();
    });
    print(imageURL);
  }

  @override
  void initState() {
    getImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
            builder: (BuildContext context) {
              return ServiceProviderAboutAndReviews(doc: widget.document,);
            }
        ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: 200,
                height: 100,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5.0),
                  child: (imageURL != null)?Image(
                    image: PCacheImage(
                      imageURL.toString(),
                    ),
                    fit: BoxFit.fill,
                  ):Center(child: CircularProgressIndicator()),
                ),
              ),
              SizedBox(
                height: 30,
                width: 200,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      widget.serviceProviderName.toString(),
                      style: TextStyle(
                        fontSize: Constants.fontSize5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Icon(
                          Icons.star,
                          size: 15,
                          color: Constants.ratingIconColor,
                        ),
                        Text(
                          '${widget.rating} ( ${widget.numberOfReviews} )',
                          style: TextStyle(
                              fontSize: Constants.fontSize6,
                              color: Constants.textColor1),
                        )
                      ],
                    ),
                ],
              ),
            ),
            SizedBox(
              width: 200,
              child: Text(
                "Burger, Fast Food, Breakfast",
                style: TextStyle(
                    fontSize: Constants.fontSize6, color: Constants.textColor1),
              ),
            ),
          ],
          ),
        ),
    );
  }
}

class ServiceProviderCardForVerticalSlider extends StatefulWidget {

  final String? serviceProviderName;
  final int? numberOfReviews;
  final num? rating;
  final QueryDocumentSnapshot? doc;

  const ServiceProviderCardForVerticalSlider({
    this.serviceProviderName,
    this.numberOfReviews,
    this.rating,
    this.doc,
  });

  @override
  _ServiceProviderCardForVerticalSliderState createState() =>
      _ServiceProviderCardForVerticalSliderState();
}

class _ServiceProviderCardForVerticalSliderState
    extends State<ServiceProviderCardForVerticalSlider> {
  String? imageURL;

  getImage() async {
    final ref = FirebaseStorage.instance
        .ref()
        .child('Restaurant Images')
        .child('${widget.doc!.id}.jpg');
    String url = await ref.getDownloadURL();
    setState(() {
      imageURL = url.toString();
    });
    print(imageURL);
  }

  @override
  void initState() {
    getImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // TODO implement Navigator
        // Navigator.push(context, MaterialPageRoute(
        //     builder: (BuildContext context) {
        //       print("jello");
        //     }
        // ));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: double.infinity,
              height: 200,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: (imageURL != null) ? Image(
                  image: PCacheImage(
                    imageURL.toString(),
                  ),
                  fit: BoxFit.fill,
                ) : Center(child: CircularProgressIndicator()),
              ),
            ),
            SizedBox(
              height: 30,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    widget.serviceProviderName.toString(),
                    style: TextStyle(
                      fontSize: Constants.fontSize5,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Constants.ratingIconColor,
                      ),
                      Text(
                        '${widget.rating} (${widget.numberOfReviews})',
                        style: TextStyle(
                            fontSize: Constants.fontSize6,
                            color: Constants.textColor1),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              // width: 200,
              child: Text(
                "Burger, Fast Food, Breakfast",
                style: TextStyle(
                    fontSize: Constants.fontSize6, color: Constants.textColor1),
              ),
            )
          ],
        ),
      ),
    );
  }
}
