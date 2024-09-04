import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primaryColor: Colors.deepPurple,
  hintColor: Colors.blueGrey,
  textTheme: const TextTheme(
    bodyLarge: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold, color: Colors.black),
    bodySmall: TextStyle(fontSize: 16.0, color: Colors.black),
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.deepPurple,
  ),
  buttonTheme: const ButtonThemeData(
    buttonColor: Colors.deepPurple,
    textTheme: ButtonTextTheme.primary,
  ),
);
