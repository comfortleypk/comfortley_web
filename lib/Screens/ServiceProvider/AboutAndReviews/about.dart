import 'package:comfortley_web/constants.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

class AboutServiceProvider extends StatefulWidget {
  final String? address;
  final String? timing;

  AboutServiceProvider({this.address, this.timing});

  @override
  _AboutServiceProviderState createState() => _AboutServiceProviderState();
}

class _AboutServiceProviderState extends State<AboutServiceProvider> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    FluentIcons.location_24_regular,
                    color: Constants.primaryColor,
                  ),
                  onPressed: null,
              ),
              TextButton(
                onPressed: () {},
                child: Text(widget.address.toString()),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                  icon: Icon(
                    FluentIcons.clock_24_regular,
                    color: Constants.primaryColor,
                  ),
                  onPressed: null),
              SizedBox(
                width: 15,
              ),
              Text("10 am to 12 pm")
            ],
          )
        ],
      ),
    );
  }
}
