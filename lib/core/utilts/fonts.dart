
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_asks/core/utilts/my_cache.dart';
import 'package:my_asks/core/utilts/my_cache_keys.dart';

class MyFonts {
  static TextStyle get subHeadingStyle {
    return GoogleFonts.lato(
        textStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        color: MyCache.getBool(key: MyCacheKeys.isDark)!
            ? Colors.grey[400]
            : Colors.grey);
  }

  static TextStyle get headingStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: MyCache.getBool(key: MyCacheKeys.isDark)!
                ? Colors.white
                : Colors.black));
  }
  static TextStyle get titleStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: MyCache.getBool(key: MyCacheKeys.isDark)!
                ? Colors.white
                : Colors.black));
  }
  static TextStyle get subTitleStyle {
    return GoogleFonts.lato(
        textStyle: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: MyCache.getBool(key: MyCacheKeys.isDark)!
                ? Colors.grey[100]
                : Colors.grey[700]));
  }
}
