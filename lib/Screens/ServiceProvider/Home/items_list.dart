import 'package:comfortley_web/Screens/CartCurrentLocation/item_card.dart';
import 'package:flutter/material.dart';

class ItemsList extends StatelessWidget {
  const ItemsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ItemCard(),
        ItemCard(),
        ItemCard(),
        ItemCard(),
        ItemCard(),
        ItemCard(),
        ItemCard(),
        ItemCard(),
      ],
    );
  }
}
