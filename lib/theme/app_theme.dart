import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFF0d253f);
const Color secondaryColor = Color(0xFF01b4e4);
const Color accentColor = Color(0xFF90cea1);
const Color blackColor = Color(0xff000000);
const Color whiteColor = Color(0xffffffff);
const Color lightBlackColor = Color(0xFF333333);
const Color whitegreyColor = Color(0xFFFAFAFA);
const Color pinkColor = Color(0xFFE91E63);
const Color redColor = Color(0xffc6153a);

final ThemeData lightTheme = ThemeData(
  primaryColor: primaryColor,
  brightness: Brightness.light,
);

final ThemeData darkTheme = ThemeData(
  primaryColor: primaryColor,
  brightness: Brightness.dark,
);
