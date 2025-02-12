import 'package:flutter/material.dart';

const Color darkBlue = Color.fromARGB(255, 0, 50, 92);
const Color background = Color.fromARGB(255, 176, 191, 196);
const Color white = Colors.white;
const Color black = Color(0xFF121212);
const Color grey = Color.fromARGB(255, 36, 36, 36);

class Themes {
  static final light = ThemeData(
    primaryColor: darkBlue,
    //colorScheme: ColorScheme.fromSeed(seedColor: darkBlue, background: white),
    brightness: Brightness.light,
  );
  static final dark = ThemeData(
    primaryColor: darkBlue,
    //colorScheme: ColorScheme.fromSeed(seedColor: darkBlue, background: darkGreyClr),
    brightness: Brightness.dark,
  );
}
