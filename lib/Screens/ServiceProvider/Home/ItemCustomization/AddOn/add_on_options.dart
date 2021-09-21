import 'package:comfortley_web/Models/button.dart';
import 'package:comfortley_web/Screens/ServiceProvider/Home/ItemCustomization/AddOn/add_on_alertbox.dart';
import 'package:comfortley_web/Screens/ServiceProvider/Home/body.dart';
import 'package:comfortley_web/constants.dart';
import 'package:flutter/material.dart';

class AddOnOptionAlertBox extends StatefulWidget {
  @override
  _AddOnOptionAlertBoxState createState() => _AddOnOptionAlertBoxState();
}

class _AddOnOptionAlertBoxState extends State<AddOnOptionAlertBox> {
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
                    color: Colors.grey, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                color: Constants.primaryColor,
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(5),
                child: Text(
                  "ADD ON",
                  style: TextStyle(fontSize: Constants.fontSize5, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      AddOnItem(),
                      AddOnItem(),
                      AddOnItem(),
                      AddOnItem(),
                    ],
                  ),
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
