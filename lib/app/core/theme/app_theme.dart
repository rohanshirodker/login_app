import 'package:flutter/material.dart';
final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.purple[900],
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.deepPurpleAccent),
  fontFamily: 'Georgia',
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
  ),
);