import 'package:flutter/material.dart';

const main = Color(0xFF42A5F5);
const darkMain = Colors.black45;
const background = Colors.white;
const darkBackground = Colors.black45;

getThemeDate({bool dark = false}) => ThemeData(
      brightness: dark ? Brightness.dark : Brightness.light,
      primaryColor: dark ? darkMain : main,
      backgroundColor: dark ? darkBackground : background,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    );
