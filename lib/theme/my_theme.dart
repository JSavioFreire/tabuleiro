import 'package:flutter/material.dart';

ThemeData myTheme = ThemeData(
  colorSchemeSeed: Colors.lightBlueAccent,
  textSelectionTheme: TextSelectionThemeData(
      selectionColor: Colors.grey[800], cursorColor: Colors.grey[800]),
  useMaterial3: true,
  iconTheme: const IconThemeData(color: Colors.white, size: 28),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black54,
          shape: ContinuousRectangleBorder(
              borderRadius: BorderRadius.circular(30)),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20))),
);
