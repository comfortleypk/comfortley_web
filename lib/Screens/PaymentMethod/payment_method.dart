import 'package:comfortley_web/Models/button.dart';
import 'package:comfortley_web/Models/completion_alert_box.dart';
import 'package:comfortley_web/Models/drawer.dart';
import 'package:comfortley_web/Models/text_field.dart';
import 'package:comfortley_web/Screens/CartCurrentLocation/cart_current_location.dart';
import 'package:comfortley_web/Screens/HomePage/home_page.dart';
import 'package:comfortley_web/Screens/Profile/body.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../constants.dart';

class PaymentMethod extends StatelessWidget {
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
      body: PaymentMethodsBody(),
    );
  }
}

class PaymentMethodsBody extends StatefulWidget {
  @override
  _PaymentMethodsBodyState createState() => _PaymentMethodsBodyState();
}

enum PaymentOptions { easypaisa, jazzcash, debit_card, cash_on_delivery }

class _PaymentMethodsBodyState extends State<PaymentMethodsBody> {
  bool _easyPaisa = true;
  bool _jazzCash = false;
  bool _cashOnDelivery = false;
  bool _debit = false;
  PaymentOptions? option = PaymentOptions.easypaisa;

  mobileAccount(String assetName) {
    return Card(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      elevation: 10.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 150,
            child: Image.asset(
              assetName,
            ),
          ),
          CustomTextField(
            verticalMargin: 5,
            horizontalMargin: 40,
            text: 'Mobile Number',
            suffixIcon: Icon(
              Icons.credit_card,
              color: Constants.primaryColor,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: CustomButton(
              margin: 5,
              padding: 80,
              iconName: FluentIcons.payment_24_regular,
              text: 'Add Payment Method',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CompletionAlertBox(
                      title: "Payment Activated!",
                      description:
                          "Payment Method has been activated successfully, Now you can order anytime.",
                      iconName: Icons.explore,
                      buttonText: "Explore",
                      onPressed: () {
                        Navigator.pop(context);
                      },
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

  bankAccount(String assetName) {
    return Card(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      elevation: 18.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 150,
            margin: EdgeInsets.only(left: 15, right: 15),
            child: Image.asset(
              assetName,
            ),
          ),
          CustomTextField(
            text: 'Card Number',
            verticalMargin: 5,
            horizontalMargin: 40,
            suffixIcon: Icon(
              Icons.credit_card,
              color: Constants.primaryColor,
            ),
            validator: (String? name) {
              if (name!.isEmpty) {
                return "Name can't be empty!";
              }
              return null;
            },
          ),
          CustomTextField(
            text: 'Card Holder Name',
            verticalMargin: 5,
            horizontalMargin: 40,
            suffixIcon: Icon(
              Icons.person,
              color: Constants.primaryColor,
            ),
            validator: (String? name) {
              if (name!.isEmpty) {
                return "Name can't be empty!";
              }
              return null;
            },
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  text: 'Expiry',
                  verticalMargin: 5,
                  horizontalMargin: 40,
                  validator: (String? name) {
                    if (name!.isEmpty) {
                      return "Name can't be empty!";
                    }
                    return null;
                  },
                ),
              ),
              Expanded(
                child: CustomTextField(
                  text: 'CVV',
                  verticalMargin: 5,
                  horizontalMargin: 40,
                  validator: (String? name) {
                    if (name!.isEmpty) {
                      return "Name can't be empty!";
                    }
                    return null;
                  },
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: CustomButton(
              margin: 5,
              padding: 80,
              iconName: FluentIcons.payment_24_regular,
              text: 'Add Payment Method',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CompletionAlertBox(
                      title: "Payment Activated!",
                      description:
                          "Payment Method has been activated successfully, Now you can order anytime.",
                      iconName: Icons.explore,
                      buttonText: "Explore",
                      onPressed: () {
                        Navigator.pop(context);
                      },
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

  cashOnDelivery(String assetName) {
    return Card(
      margin: EdgeInsets.only(top: 10, left: 10, right: 10, bottom: 10),
      elevation: 18.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 150,
            child: Image.asset(
              assetName,
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 15),
            child: CustomButton(
              margin: 5,
              padding: 80,
              iconName: FluentIcons.payment_24_regular,
              text: 'Add Payment Method',
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return CompletionAlertBox(
                      title: "Payment Activated!",
                      description:
                          "Payment Method has been activated successfully, Now you can order anytime.",
                      iconName: Icons.explore,
                      buttonText: "Explore",
                      onPressed: () {
                        Navigator.pop(context);
                      },
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

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor:
          Constants.primaryColor, //or set color with: Color(0xFF0000FF)
    ));
    return SafeArea(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 20, left: 15),
              child: Text(
                'Payment Methods',
                style: TextStyle(
                  fontSize: Constants.fontSize1,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text(
                'Easypaisa',
                style: TextStyle(
                  fontSize: Constants.fontSize2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                value: PaymentOptions.easypaisa,
                groupValue: option,
                onChanged: (PaymentOptions? value) {
                  setState(() {
                    option = value;
                    _easyPaisa = true;
                    _jazzCash = false;
                    _debit = false;
                    _cashOnDelivery = false;
                  });
                },
              ),
            ),
            if (_easyPaisa) mobileAccount('images/easypaisa.png'),
            ListTile(
              title: Text(
                'Jazzcash',
                style: TextStyle(
                  fontSize: Constants.fontSize2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                value: PaymentOptions.jazzcash,
                groupValue: option,
                onChanged: (PaymentOptions? value) {
                  setState(() {
                    option = value;
                    _easyPaisa = false;
                    _jazzCash = true;
                    _debit = false;
                    _cashOnDelivery = false;
                  });
                },
              ),
            ),
            if (_jazzCash) mobileAccount('images/jazzcash.png'),
            ListTile(
              title: Text(
                'Debit/Credit Card',
                style: TextStyle(
                  fontSize: Constants.fontSize2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                value: PaymentOptions.debit_card,
                groupValue: option,
                onChanged: (PaymentOptions? value) {
                  setState(() {
                    option = value;
                    _easyPaisa = false;
                    _jazzCash = false;
                    _debit = true;
                    _cashOnDelivery = false;
                  });
                },
              ),
            ),
            if (_debit) bankAccount('images/debit_card.png'),
            ListTile(
              title: Text(
                'Cash on Delivery',
                style: TextStyle(
                  fontSize: Constants.fontSize2,
                  fontWeight: FontWeight.bold,
                ),
              ),
              leading: Radio(
                value: PaymentOptions.cash_on_delivery,
                groupValue: option,
                onChanged: (PaymentOptions? value) {
                  setState(() {
                    option = value;
                    _easyPaisa = false;
                    _jazzCash = false;
                    _debit = false;
                    _cashOnDelivery = true;
                  });
                },
              ),
            ),
            if (_cashOnDelivery) cashOnDelivery('images/cash_on_delivery.png'),
          ],
        ),
      ),
    );
  }
}
