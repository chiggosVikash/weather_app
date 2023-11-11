import 'package:flutter/material.dart';
import 'package:weather_app/enums/weathertype_enums.dart';

class Constant {
  static LinearGradient backgroundWeatherGradient(WeatherType weatherType) {
    switch (weatherType) {
      case WeatherType.rainy:
        return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff4682B4),
              Color(0xff87CEFA),
            ]);
      case WeatherType.mostlycloudy:
        return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 42, 100, 147),
              Color.fromARGB(255, 186, 192, 215)
            ]);
      case WeatherType.thunderstorm:
        return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff1E1E1E),
              Color(0xff4169E1),
            ]);
      case WeatherType.sunny:
        return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 220, 198, 134),
              Color.fromARGB(255, 62, 160, 240),
            ]);
      // case WeatherType.cloudy:
      //   return const LinearGradient(
      //       begin: Alignment.topCenter,
      //       end: Alignment.bottomCenter,
      //       colors: [
      //         Color(0xff87CEEB),
      //         Color.fromARGB(255, 192, 184, 115),
      //       ]);
      default:
        return const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(144, 12, 12, 12),
              Colors.black,
            ]);
    }
  }
}
