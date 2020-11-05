import 'package:flutter/material.dart';

class ScreenHelper {
  void showToast(BuildContext context, String error) {
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(error),
    ));
  }
}
