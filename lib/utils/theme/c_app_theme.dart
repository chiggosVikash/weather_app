import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CAppTheme {
  CAppTheme._();

  /// The light theme for the Weather App.
  ///
  /// This theme uses the color scheme generated from the seed color blue,
  /// with a custom text theme and a white scaffold background color.
  /// It also sets the primary color to blue and enables Material 3.
  static final lightTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      textTheme: GoogleFonts.robotoSlabTextTheme(),
      primaryColor: Colors.blue,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.white);

  /// The dark theme for the Weather App.
  ///
  /// This theme is used to style the app when the user has selected the dark mode.
  /// It uses a blue primary color and a custom text theme.
  /// The scaffold background color is set to a light shade of black.
  static final dartTheme = ThemeData(
      primaryColor: Colors.blue,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      // textTheme: CustomTextTheme.darkTextTheme,
      useMaterial3: true,
      scaffoldBackgroundColor: Colors.black12);
}
