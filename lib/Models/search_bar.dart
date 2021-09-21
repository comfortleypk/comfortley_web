
import 'package:comfortley_web/constants.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final String? hintTxt;
  final TextEditingController? controller;

  const SearchBar({this.hintTxt, this.controller});

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Row(
        children: <Widget>[
          IconButton(
            icon: Icon(FluentIcons.search_24_regular, color: Constants.hintTextColor,),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              textAlign: TextAlign.left,
              controller: controller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  color: Constants.shadeColor
                ),
                hintText: hintTxt,
                border: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
