import 'package:flutter/material.dart';

class MyThemeData {
  static const Color lightScaffildBackground =
      Color.fromARGB(255, 223, 236, 219);
  static const Color darkScaffildBackground = Color.fromARGB(255, 6, 14, 30);
  static final ThemeData lightTheme = ThemeData(
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
          headline2: TextStyle(
            fontSize: 18,
            color: Colors.black,
          ),
          headline3: TextStyle(
              fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(fontSize: 18, color: Colors.black45),
          subtitle2: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black)),
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: lightScaffildBackground);
  static final ThemeData darkTheme = ThemeData(
      textTheme: TextTheme(
          headline1: TextStyle(
              fontSize: 25, color: Colors.blue, fontWeight: FontWeight.bold),
          headline2: TextStyle(
            fontSize: 18,
            color: Colors.white,
          ),
          headline3: TextStyle(
              fontSize: 25, color: Colors.green, fontWeight: FontWeight.bold),
          subtitle1: TextStyle(fontSize: 18, color: Colors.white),
          subtitle2: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white)),
      primarySwatch: Colors.blue,
      scaffoldBackgroundColor: darkScaffildBackground);
}
