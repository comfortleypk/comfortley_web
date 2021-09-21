
import 'package:comfortley_web/constants.dart';
import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

class ShareOnSocialSites extends StatelessWidget {
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
  contentBox(context){
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 20,top: 20, right: 20,bottom: 20),
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(color: Colors.grey,offset: Offset(0,10),
                    blurRadius: 10
                ),
              ]
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text('Share',style: TextStyle(fontSize: Constants.fontSize2,fontWeight: FontWeight.bold,),),
             SizedBox(
               height: 300,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   SignInButton(
                     btnText: 'Share on Facebook',
                     buttonType: ButtonType.facebook,
                     onPressed: () {

                     },
                   ),
                   SignInButton(
                     btnText: 'Share on Twitter',
                     buttonType: ButtonType.twitter,
                     onPressed: () {

                     },
                   ),
                   SignInButton(
                     btnText: 'Share on Google',
                     buttonType: ButtonType.google,
                     onPressed: () {

                     },
                   ),
                   SignInButton(
                     btnText: 'Share on Email',
                     buttonType: ButtonType.mail,
                     onPressed: () {

                     },
                   ),
                 ],
               ),
             )
            ],
          ),
        ),

      ],
    );
  }
}
