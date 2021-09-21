import 'package:autocomplete_textfield_ns/autocomplete_textfield_ns.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:comfortley_web/Models/card.dart';
import 'package:comfortley_web/Models/drawer.dart';
import 'package:comfortley_web/Screens/CartCurrentLocation/cart_current_location.dart';
import 'package:comfortley_web/Screens/HomePage/most_orders_slider.dart';
import 'package:comfortley_web/Screens/Profile/body.dart';
import 'package:comfortley_web/Screens/ServiceProvider/Home/body.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants.dart';
import 'higher_ratings_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  TextEditingController searchBarController = TextEditingController();
  Stream<QuerySnapshot> allRestaurants =
      FirebaseFirestore.instance.collection('Restaurants').snapshots();
  GlobalKey<AutoCompleteTextFieldState<String>> key = new GlobalKey();
  String currentText = '';
  List<String> suggestions = [];

  getAllRestaurants(AsyncSnapshot<QuerySnapshot> snapshot) {
    return snapshot.data!.docs.map((doc) {
      return ServiceProviderCardForVerticalSlider(
        serviceProviderName: doc.get('name'),
        numberOfReviews: doc.get('numberOfReviews'),
        rating: doc.get('rating'),
        doc: doc,
      );
    }).toList();
  }

  getStringSuggestions() async {
    List<QueryDocumentSnapshot> documents = [];
    List<String> temp = [];
    FirebaseFirestore.instance.collection('Restaurants').get().then((value) {
      documents = value.docs;
      for (int i = 0; i < documents.length; i++) {
        suggestions.insert(i, documents[i].get('name'));
      }
      setState(() {
        suggestions = temp;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    getStringSuggestions();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Constants.primaryColor, //or set color with: Color(0xFF0000FF)
    ));
    var _scaffoldKey = GlobalKey<ScaffoldState>();

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
        title: Text(
          "Comfortley",
          style: TextStyle(
              color: Constants.primaryColor, fontSize: Constants.fontSize1),
        ),
        actions: <Widget>[
          IconButton(
            tooltip: "Food Cart",
            icon: Icon(
              FluentIcons.cart_24_regular,
              color: Constants.primaryColor,
            ),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return Cart();
              }));
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
              }));
            },
          ),
        ],
      ),
      drawer: CustomDrawer.drawer(context),
      body: Column(
        children: <Widget>[
          Container(
            color: Constants.secondaryColor,
            padding: EdgeInsets.only(
              top: 10,
              left: 50,
              right: 50,
            ),
            child: Container(
              height: 45,
              decoration: BoxDecoration(
                color: Constants.shadeColor,
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: TabBar(
                controller: _tabController,
                unselectedLabelColor: Constants.primaryColor,
                labelColor: Constants.secondaryColor,
                indicatorWeight: 2,
                indicator: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                  color: Constants.primaryColor,
                ),
                tabs: <Widget>[
                  Tab(
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.delivery_dining,
                              size: 30,
                            ),
                            onPressed: null),
                        Text(
                          "Delivery",
                          style: TextStyle(
                            fontSize: Constants.fontSize4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Tab(
                    child: Row(
                      children: [
                        IconButton(
                            icon: Icon(
                              Icons.dinner_dining,
                              size: 30,
                            ),
                            onPressed: null),
                        Text(
                          "Pickup",
                          style: TextStyle(
                            fontSize: Constants.fontSize4,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Constants.secondaryColor,
              boxShadow: [
                BoxShadow(
                  color: Constants.shadeColor,
                  offset: Offset(0, 5),
                  blurRadius: 10,
                ),
              ],
              borderRadius: BorderRadius.circular(30),
            ),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            height: 50,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Icon(
                    Icons.search,
                    color: Constants.primaryColor,
                  ),
                ),
                Expanded(
                  flex: 9,
                  child: AutoCompleteTextField(
                    key: key,
                    decoration: InputDecoration(
                      hintStyle: TextStyle(color: Colors.black),
                      hintText: 'Search for restaurants!!',
                      border: InputBorder.none,
                    ),
                    controller: searchBarController,
                    suggestions: suggestions,
                    textChanged: (text) => currentText = text,
                    clearOnSubmit: true,
                    itemBuilder: (BuildContext context, String suggestion) =>
                        Padding(
                            child: ListTile(
                              onTap: () {
                                FirebaseFirestore.instance
                                    .collection('Restaurants')
                                    .doc(suggestion.toString())
                                    .get()
                                    .then((value) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) {
                                        return ServiceProviderHome();
                                      },
                                    ),
                                  );
                                });
                              },
                              title: Text(suggestion),
                            ),
                            padding: EdgeInsets.all(8.0)),
                    textSubmitted: (text) {},
                    itemFilter: (String suggestion, input) => suggestion
                        .toLowerCase()
                        .startsWith(input.toLowerCase()),
                    itemSubmitted: (String data) {},
                    itemSorter: (String a, String b) {
                      return 0;
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    HigherRatingsSlider(
                      title: "Higher Ratings",
                    ),
                    MostOrdersSlider(
                      title: "Most Orders",
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      width: double.infinity,
                      child: Text(
                        "All Restaurants",
                        style: TextStyle(
                          fontSize: Constants.fontSize1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 500,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: allRestaurants,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(child: CircularProgressIndicator());
                          } else {
                            return new ListView(
                              children: getAllRestaurants(snapshot),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
                ListView(
                  children: <Widget>[
                    HigherRatingsSlider(
                      title: "Higher Ratings",
                    ),
                    MostOrdersSlider(
                      title: "Most Orders",
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      width: double.infinity,
                      child: Text(
                        "All Restaurants",
                        style: TextStyle(
                          fontSize: Constants.fontSize1,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      height: 500,
                      child: StreamBuilder<QuerySnapshot>(
                        stream: allRestaurants,
                        builder: (BuildContext context,
                            AsyncSnapshot<QuerySnapshot> snapshot) {
                          if (!snapshot.hasData) {
                            return Center(
                              child: CircularProgressIndicator(),
                            );
                          } else {
                            return new ListView(
                              children: getAllRestaurants(snapshot),
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
