import 'package:flutter/material.dart';
import 'package:my_asks/core/utilts/colors.dart';

class Themes{
  static final light=ThemeData(
    primaryColor: Colors.white,
    brightness: Brightness.light
  );
  static final dark=ThemeData(
      primaryColor: darkGreyClr,
      brightness: Brightness.dark
  );
  static ThemeMode changeTheme(){
    return ThemeMode.dark;
  }

}