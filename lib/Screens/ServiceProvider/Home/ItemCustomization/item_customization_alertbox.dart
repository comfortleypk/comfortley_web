import 'package:comfortley_web/Models/button.dart';
import 'package:comfortley_web/Screens/ServiceProvider/Home/ItemCustomization/selective_options.dart';
import 'package:comfortley_web/Screens/ServiceProvider/Home/body.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../constants.dart';

class ItemCustomization extends StatefulWidget {
  final String? oldText;
  final String? newText;
  final String? confirmText;
  final String? titleText;
  final String? description;

  ItemCustomization(
      {this.titleText,
      this.oldText,
      this.newText,
      this.confirmText,
      this.description});

  @override
  _ItemCustomizationState createState() => _ItemCustomizationState();
}

class _ItemCustomizationState extends State<ItemCustomization> {

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20, top: 20, right: 20, bottom: 20),
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, offset: Offset(0, 10), blurRadius: 10,),
              ],),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(5),
                width: double.infinity,
                color: Constants.primaryColor,
                child: Text(
                  "CUSTOMIZE ITEM",
                  style: TextStyle(
                      fontSize: Constants.fontSize5,
                      fontWeight: FontWeight.bold,),
                ),
              ),
              Container(
                margin: EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mega deal",
                      style: TextStyle(fontSize: Constants.fontSize5),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(fontSize: Constants.fontSize5),
                        ),
                        Text(
                          "from Rs.399",
                          style: TextStyle(fontSize: Constants.fontSize5),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                color: Constants.primaryColor,
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(5),
                child: Text(
                  "PLEASE SELECT",
                  style: TextStyle(
                    fontSize: Constants.fontSize5,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 180,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Option(),
                      Option(),
                      Option(),
                      Option(),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(5),
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(
                          "Quantity",
                          style: TextStyle(fontSize: Constants.fontSize4),
                        )),
                    Container(
                      width: 125,
                      height: 30,
                      padding: EdgeInsets.only(right: 5),
                      decoration: BoxDecoration(
                          color: Constants.shadeColor,
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
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
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(5),
                color: Constants.primaryColor,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Total Price"), Text("399.0")],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  alignment: Alignment.center,
                  height: 45,
                  margin: EdgeInsets.only(
                      top: 20.0, left: 50.0, right: 50.0, bottom: 0.0),
                  child: CustomButton(
                    iconName: Icons.check,
                    padding: 20,
                    text: "Confirm",
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ServiceProviderHome();
                          }
                      ),);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
