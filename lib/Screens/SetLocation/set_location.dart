import 'dart:async';
import 'package:comfortley_web/Models/button.dart';
import 'package:comfortley_web/Models/drawer.dart';
import 'package:comfortley_web/Models/search_bar.dart';
import 'package:comfortley_web/Screens/CartCurrentLocation/cart_current_location.dart';
import 'package:comfortley_web/Screens/HomePage/home_page.dart';
import 'package:comfortley_web/Screens/Profile/body.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/directions.dart';
import '../../constants.dart';

class SetLocation extends StatefulWidget {
  @override
  _SetLocationState createState() => _SetLocationState();
}

class _SetLocationState extends State<SetLocation> {
  LatLng? currentLocation;
  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(33.719361, 73.074144),
    zoom: 15,
  );
  String placesAPI = 'AIzaSyAWRvNogV8bQvxjyiXmW6Tex_EXsaeSZ1c';
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  GoogleMapController? afterSearchCompletedController;
  TextEditingController searchController = TextEditingController();

  Future<Address> getAddress(Coordinates coordinates) async {
    GeoCode geoCode = GeoCode();
    Address address = await geoCode.reverseGeocoding(
      latitude: coordinates.latitude!.toDouble(),
      longitude: coordinates.longitude!.toDouble(),
    );
    return address;
  }

  Future<void> placesSearch() async {
    var prediction = await PlacesAutocomplete.show(
      context: context,
      apiKey: placesAPI,
      mode: Mode.overlay,
      radius: 1000,
      language: 'en',
      location: Location(
        lat: currentLocation!.latitude,
        lng: currentLocation!.longitude,
      ),
    );
    GeoCode geoCode = GeoCode();
    var coordinates = await geoCode.forwardGeocoding(
        address: prediction!.description.toString());
    searchController.text = prediction.description.toString();
    setState(() {
      currentLocation = LatLng(
        coordinates.latitude!.toDouble(),
        coordinates.longitude!.toDouble(),
      );
    });
    afterSearchCompletedController!
        .animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: currentLocation!,
      zoom: 25,
    )));
    print(prediction.description);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor:
            Constants.primaryColor, //or set color with: Color(0xFF0000FF)
      ),
    );
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
            "Comfortley",
            style: TextStyle(
              color: Constants.primaryColor,
              fontSize: Constants.fontSize1,
            ),
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Profile();
                  },
                ),
              );
            },
          ),
        ],
      ),
      drawer: CustomDrawer.drawer(context),
      body: Column(
        children: <Widget>[
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
              borderRadius: BorderRadius.circular(20),
            ),
            margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
            height: 50,
            width: double.infinity,
            child: InkWell(
              onTap: () {
                placesSearch();
              },
              child: SearchBar(
                controller: searchController,
                hintTxt: "Set Your Preferred Location",
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
              borderRadius: BorderRadius.circular(20),
            ),
            height: 450,
            width: double.infinity,
            margin: EdgeInsets.only(bottom: 10),
            child: Stack(
              children: [
                GoogleMap(
                  mapToolbarEnabled: true,
                  mapType: MapType.satellite,
                  initialCameraPosition: _kGooglePlex,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  compassEnabled: true,
                  onMapCreated: (GoogleMapController controller) async {
                    currentLocation =
                        await controller.getLatLng(ScreenCoordinate(
                      x: MediaQuery.of(context).size.width ~/ 2,
                      y: MediaQuery.of(context).size.height ~/ 2,
                    ));
                    print(currentLocation!.latitude);
                    print(currentLocation!.longitude);
                    afterSearchCompletedController = controller;
                    _controller.complete(controller);
                  },
                  onCameraMove: (CameraPosition p) {
                    currentLocation = p.target;
                  },
                  onCameraIdle: () async {
                    print(currentLocation!.latitude);
                    print(currentLocation!.longitude);
                    final coordinate = Coordinates(
                      latitude: currentLocation!.latitude,
                      longitude: currentLocation!.longitude,
                    );
                    Address address = await getAddress(coordinate);
                    print(address.streetAddress);
                  },
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(bottom: 25.0),
                  child: Icon(
                    Icons.location_on,
                    color: Constants.primaryColor,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 45,
            margin: EdgeInsets.only(
                top: 20.0, left: 50.0, right: 50.0, bottom: 0.0),
            padding: EdgeInsets.only(bottom: 5),
            child: CustomButton(
              padding: 40,
              iconName: FluentIcons.location_24_filled,
              text: 'Set Location',
              onPressed: () async {
                Address address = await getAddress(
                  Coordinates(
                    latitude: currentLocation!.latitude,
                    longitude: currentLocation!.longitude,
                  ),
                );
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text(
                          'Do you want to confirm this as your default address?'),
                      content: Text(address.streetAddress.toString()),
                      actions: [
                        CustomTextButton(
                          text: 'OK',
                          onPressed: () {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return HomePage();
                                },
                              ),
                            );
                          },
                        ),
                        CustomTextButton(
                          text: 'Cancel',
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
