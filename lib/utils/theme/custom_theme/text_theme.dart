import 'package:flutter/material.dart';

class CustomTextTheme {
  CustomTextTheme._();

  // final double _headlineLargeFontSize = 21;
  // final double _headlineMediumFontSize = 19;
  // final double _headlineSmallFontSize = 16;

  static const lightTextTheme = TextTheme(
    headlineLarge: TextStyle(
        color: Colors.black, fontSize: 21, fontWeight: FontWeight.w300),
    headlineMedium: TextStyle(
      color: Colors.black,
      fontSize: 19,
      fontWeight: FontWeight.w300,
    ),
    headlineSmall: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),

    /// body
    bodyLarge: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 13,
      fontWeight: FontWeight.w300,
    ),
  );

  static const darkTextTheme = TextTheme(
    headlineLarge: TextStyle(
        color: Colors.white, fontSize: 21, fontWeight: FontWeight.w300),
    headlineMedium: TextStyle(
      color: Colors.white,
      fontSize: 19,
      fontWeight: FontWeight.w300,
    ),
    headlineSmall: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),

    /// body
    bodyLarge: TextStyle(
      color: Colors.white,
      fontSize: 16,
      fontWeight: FontWeight.w300,
    ),
    bodyMedium: TextStyle(
      color: Colors.white,
      fontSize: 14,
      fontWeight: FontWeight.w300,
    ),
    bodySmall: TextStyle(
      color: Colors.white,
      fontSize: 13,
      fontWeight: FontWeight.w300,
    ),
  );
}
