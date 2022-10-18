import 'package:flutter/material.dart';

Map<int, Color> color = {
  50: const Color.fromRGBO(136, 14, 79, .1),
  100: const Color.fromRGBO(136, 14, 79, .2),
  200: const Color.fromRGBO(136, 14, 79, .3),
  300: const Color.fromRGBO(136, 14, 79, .4),
  400: const Color.fromRGBO(136, 14, 79, .5),
  500: const Color.fromRGBO(136, 14, 79, .6),
  600: const Color.fromRGBO(136, 14, 79, .7),
  700: const Color.fromRGBO(136, 14, 79, .8),
  800: const Color.fromRGBO(136, 14, 79, .9),
  900: const Color.fromRGBO(136, 14, 79, 1),
};

const Color bluishClr = Color(0xff4e5ae8);
const Color yellowClr = Color(0xffffb746);
const Color pinkClr = Color(0xffff4667);
const Color white = Colors.white;
MaterialColor primarySwatchClr = MaterialColor(0xff4e5ae8, color);
const Color primaryColor = bluishClr;
const Color darkGreyClr = Color(0xff121212);
MaterialColor darkSwatchClr = MaterialColor(0xff121212, color);
const Color darkHeaderClr = Color(0XFF424242);

class Themes {
  static final lightMode = ThemeData(
      primaryColor: primaryColor,
      primarySwatch: primarySwatchClr,
      brightness: Brightness.light);

  static final darkMode = ThemeData(
      primaryColor: darkGreyClr,
      primarySwatch: darkSwatchClr,
      brightness: Brightness.dark);
}
