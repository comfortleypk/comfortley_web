import 'package:comfortley_web/Models/button.dart';
import 'package:comfortley_web/Models/completion_alert_box.dart';
import 'package:comfortley_web/Models/text_field.dart';
import 'package:comfortley_web/Screens/Profile/body.dart';
import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';

import '../../constants.dart';

class CustomDialogBox extends StatefulWidget {
  final String? oldText;
  final String? newText;
  final String? confirmText;
  final String? titleText;
  final String? description;
  final TextInputType? inputType;

  CustomDialogBox(
      {this.titleText,
      this.oldText,
      this.newText,
      this.confirmText,
      this.inputType,
      this.description});

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  final TextEditingController _oldController = TextEditingController();
  final TextEditingController _newController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

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
              color: Constants.secondaryColor,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Constants.shadeColor,
                    offset: Offset(0, 10),
                    blurRadius: 10,),
              ],),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text(
                  widget.titleText.toString(),
                  style: TextStyle(
                      fontSize: Constants.fontSize2,
                      fontWeight: FontWeight.bold,),
                ),
                CustomTextField(
                  text: widget.oldText,
                  controller: _oldController,
                  validator: (String? name) {
                    if (name!.isEmpty) {
                      return "Name can't be empty!";
                    }
                    return null;
                  },
                  inputType: TextInputType.text,
                  verticalMargin: 10,
                ),
                CustomTextField(
                  text: widget.newText,
                  controller: _newController,
                  validator: (String? name) {
                    if (name!.isEmpty) {
                      return "Name can't be empty!";
                    }
                    return null;
                  },
                  inputType: TextInputType.text,
                  verticalMargin: 10,
                ),
                CustomTextField(
                  text: widget.confirmText,
                  controller: _confirmController,
                  validator: (String? name) {
                    if (name!.isEmpty) {
                      return "Name can't be empty!";
                    }
                    return null;
                  },
                  inputType: TextInputType.text,
                  verticalMargin: 10,
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: 20.0, left: 40.0, right: 40.0, bottom: 0.0,),
                  child: CustomButton(
                      margin: 20,
                      padding: 40,
                      iconName: Icons.update,
                      text: 'Update',
                      onPressed: () {
                        showDialog(
                            context: context,
                            builder: (BuildContext ctx) {
                              return CompletionAlertBox(
                                description: widget.description,
                                iconName: Icons.arrow_back,
                                buttonText: "Back",
                                title: widget.titleText,
                                onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (BuildContext context) {
                                          return Profile();
                                        }
                                    ),);
                                },
                              );
                            },);
                      }),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
