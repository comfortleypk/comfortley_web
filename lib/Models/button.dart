import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../constants.dart';

class CustomButton extends StatelessWidget {

  final String? text;
  final Function()? onPressed;
  final double? padding;
  final double? margin;
  final IconData? iconName;

  CustomButton ({this.text,this.margin,this.padding,this.iconName,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: margin ?? 0.0),
      padding: EdgeInsets.symmetric(horizontal: padding ?? 0.0),
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(iconName),
            if (iconName != null) SizedBox(width: 5,),
            Center(child: Text(text.toString(), textAlign: TextAlign.center,)),
          ],
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
              side: BorderSide(
                color: Constants.primaryColor,
                width: 2.5,
              ),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(Constants.primaryColor),
          textStyle: MaterialStateProperty.all(
            TextStyle(
              color: Constants.secondaryColor,
            ),
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
class CustomTextButton extends StatelessWidget {

  final String? text;
  final Function()? onPressed;

  CustomTextButton({
    this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Text(
        text.toString(),
        style: TextStyle(
          color: Constants.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: onPressed,
    );
  }
}