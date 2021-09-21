import 'package:comfortley_web/Models/drawer.dart';
import 'package:comfortley_web/Screens/CartCurrentLocation/cart_current_location.dart';
import 'package:comfortley_web/Screens/HomePage/home_page.dart';
import 'package:comfortley_web/Screens/Profile/body.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants.dart';

class FAQ extends StatefulWidget {
  @override
  _FAQState createState() => _FAQState();
}

class _FAQState extends State<FAQ> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Constants.primaryColor, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Constants.secondaryColor,
      appBar: AppBar(
        backgroundColor: Constants.secondaryColor,
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState!.openDrawer();
          },
          child: Icon(
            Icons.dehaze,
            color: Constants.primaryColor,
          ),
        ),
        title: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return HomePage();
                },
              ),
            );
          },
          child: Text(
            'Comfortley',
            style: TextStyle(
                color: Constants.primaryColor, fontSize: Constants.fontSize1),
          ),
        ),
        actions: <Widget>[
          IconButton(
            tooltip: "Food Cart",
            icon: Icon(
              FluentIcons.cart_24_regular,
              color: Constants.primaryColor,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Cart();
                  },
                ),
              );
            },
          ),
          IconButton(
            tooltip: "User Profile",
            icon: Icon(
              FluentIcons.person_24_regular,
              color: Constants.primaryColor,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return Profile();
              },),);
            },
          ),
        ],
      ),
      drawer: CustomDrawer.drawer(context),
      body: FAQBody(),
    );
  }
}

class FAQBody extends StatefulWidget {
  @override
  _FAQBodyState createState() => _FAQBodyState();
}

class _FAQBodyState extends State<FAQBody> {
  bool faq0 = false;
  bool faq1 = false;
  bool faq2 = false;
  bool faq3 = false;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Constants.primaryColor, //or set color with: Color(0xFF0000FF)
    ),);
    return SafeArea(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 15),
            child: Text(
              'FAQ',
              style: TextStyle(
                fontSize: Constants.fontSize1,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10, left: 10, right: 10),
            decoration: BoxDecoration(
              color: Constants.secondaryColor,
              boxShadow: [
                BoxShadow(
                  color: Constants.shadeColor,
                  offset: Offset(0, 5),
                  blurRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                if (index == 0) {
                  if (faq0) {
                    setState(() {
                      faq0 = false;
                      faq1 = false;
                      faq2 = false;
                      faq3 = false;
                    });
                  } else {
                    setState(() {
                      faq0 = true;
                      faq1 = false;
                      faq2 = false;
                      faq3 = false;
                    });
                  }
                } else if (index == 1) {
                  if (faq1) {
                    setState(() {
                      faq0 = false;
                      faq1 = false;
                      faq2 = false;
                      faq3 = false;
                    });
                  } else {
                    setState(() {
                      faq0 = false;
                      faq1 = true;
                      faq2 = false;
                      faq3 = false;
                    });
                  }
                } else if (index == 2) {
                  if (faq2) {
                    setState(() {
                      faq0 = false;
                      faq1 = false;
                      faq2 = false;
                      faq3 = false;
                    });
                  } else {
                    setState(() {
                      faq0 = false;
                      faq1 = false;
                      faq2 = true;
                      faq3 = false;
                    });
                  }
                } else if (index == 3) {
                  if (faq3) {
                    setState(() {
                      faq0 = false;
                      faq1 = false;
                      faq2 = false;
                      faq3 = false;
                    });
                  } else {
                    setState(() {
                      faq0 = false;
                      faq1 = false;
                      faq2 = false;
                      faq3 = true;
                    });
                  }
                }
              },
              children: [
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(
                        'What is something?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                  canTapOnHeader: true,
                  body: ListTile(
                    title: Text(Constants.dummyText),
                  ),
                  isExpanded: faq0,
                ),
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(
                        'What is something?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                  canTapOnHeader: true,
                  body: ListTile(
                    title: Text(Constants.dummyText),
                  ),
                  isExpanded: faq1,
                ),
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(
                        'What is something?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                  canTapOnHeader: true,
                  body: ListTile(
                    title: Text(Constants.dummyText),
                  ),
                  isExpanded: faq2,
                ),
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                      title: Text(
                        'What is something?',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    );
                  },
                  canTapOnHeader: true,
                  body: ListTile(
                    title: Text(Constants.dummyText),
                  ),
                  isExpanded: faq3,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//
// Card(
// margin: EdgeInsets.only(top: 10, left: 10, right: 10),
// //elevation: 18.0,
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(18),
// ),
// child: ExpansionPanelList(
// expansionCallback: (int index, bool isExpanded) {
// if (index == 0) {
// setState(() {
// faq0 = true;
// faq1 = false;
// faq2 = false;
// faq3 = false;
// });
// } else if (index == 1) {
// setState(() {
// faq0 = false;
// faq1 = true;
// faq2 = false;
// faq3 = false;
// });
// } else if (index == 2) {
// setState(() {
// faq0 = false;
// faq1 = false;
// faq2 = true;
// faq3 = false;
// });
// } else if (index == 3) {
// setState(() {
// faq0 = false;
// faq1 = false;
// faq2 = false;
// faq3 = true;
// });
// }
// },
// children: [
// ExpansionPanel(
// headerBuilder: (BuildContext context, bool isExpanded) {
// return ListTile(
// title: Text(
// 'What is something?',
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold,
// ),
// ),
// );
// },
// canTapOnHeader: true,
// body: ListTile(
// title: Text(Constants.dummyText),
// ),
// isExpanded: faq0,
// ),
// ExpansionPanel(
// headerBuilder: (BuildContext context, bool isExpanded) {
// return ListTile(
// title: Text(
// 'What is something?',
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold,
// ),
// ),
// );
// },
// canTapOnHeader: true,
// body: ListTile(
// title: Text(Constants.dummyText),
// ),
// isExpanded: faq1,
// ),
// ExpansionPanel(
// headerBuilder: (BuildContext context, bool isExpanded) {
// return ListTile(
// title: Text(
// 'What is something?',
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold,
// ),
// ),
// );
// },
// canTapOnHeader: true,
// body: ListTile(
// title: Text(Constants.dummyText),
// ),
// isExpanded: faq2,
// ),
// ExpansionPanel(
// headerBuilder: (BuildContext context, bool isExpanded) {
// return ListTile(
// title: Text(
// 'What is something?',
// style: TextStyle(
// fontSize: 20,
// fontWeight: FontWeight.bold,
// ),
// ),
// );
// },
// canTapOnHeader: true,
// body: ListTile(
// title: Text(Constants.dummyText),
// ),
// isExpanded: faq3,
// ),
// ],
// ),
// ),
