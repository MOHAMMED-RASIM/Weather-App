import 'package:flutter/material.dart';

class Providerstate extends ChangeNotifier {
  bool changetheme = false;
  void switchmod(bool value) {
    changetheme = value;
    notifyListeners();
  }
}
