import 'package:flutter/material.dart';

class theme {

  static ThemeData lightmode = ThemeData(
  appBarTheme:AppBarTheme(color: Colors.white),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.white,
      textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.black)));

  static ThemeData darkmode = ThemeData(
      appBarTheme: AppBarTheme(color: Colors.black),
      scaffoldBackgroundColor: Colors.black,
      primaryColor: Colors.black,
      textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white)));
}
