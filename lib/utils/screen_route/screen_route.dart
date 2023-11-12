import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_type_model.dart';
import 'package:weather_app/features/weather/presentation/screens/cities_list_page.dart';
import 'package:weather_app/features/weather/presentation/screens/individual_weather_info.dart';

class ScreenRoute {
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        final args = settings.arguments as WeatherTypeDModel;
        return MaterialPageRoute(
            builder: (context) => IndividualWeatherInfo(weatherInfoData: args));

      case CitiesListPage.routeAddress:
        return MaterialPageRoute(builder: (context) => const CitiesListPage());

      default:
        return MaterialPageRoute(
            builder: (context) => Scaffold(
                  appBar: AppBar(
                    title: const Text("Route Does not found"),
                  ),
                  body: const Center(child: Text("Route does not exist")),
                ));
    }
  }
}
