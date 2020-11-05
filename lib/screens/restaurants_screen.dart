import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RestaurantsScreen extends StatefulWidget {
  static String id = "/restaurants";

  @override
  _RestaurantsScreenState createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurants"),
        centerTitle: true,
      ),
    );
  }
}
