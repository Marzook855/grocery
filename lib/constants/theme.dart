import 'package:flutter/material.dart';

ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColor: Colors.blue,
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Colors.blue,
        textStyle: const TextStyle(
          color: Colors.blue,
        ),
        side: const BorderSide(color: Colors.blue, width: 1.7),
        disabledBackgroundColor: Colors.blue.withOpacity(0.38),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: outlineInputBorder,
      errorBorder: outlineInputBorder,
      enabledBorder: outlineInputBorder,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      focusedBorder: outlineInputBorder,
      disabledBorder: outlineInputBorder,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
        textStyle: const TextStyle(
          fontSize: 18.0,
        ),
        disabledBackgroundColor: Colors.grey,
      ),
    ),
    primarySwatch: Colors.blue,
    canvasColor: Colors.blue,
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0.0,
      toolbarTextStyle: TextStyle(
        color: Colors.black,
      ),
      iconTheme: IconThemeData(color: Colors.black),
    ));
OutlineInputBorder outlineInputBorder = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey,
  ),
);
