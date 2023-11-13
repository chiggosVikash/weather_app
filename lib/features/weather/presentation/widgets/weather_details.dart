import 'package:flutter/material.dart';
import 'package:weather_app/features/weather/presentation/widgets/daywise_weather_details.dart';
import 'package:weather_app/features/weather/presentation/widgets/hourly_weather_details.dart';
import 'package:weather_app/widgets/transparent_card.dart';

class WeatherDetails extends StatelessWidget {
  final BoxConstraints constraints;
  const WeatherDetails({super.key, required this.constraints});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: constraints.maxWidth * .03,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: constraints.maxHeight * .03,
          ),
          TransparentCard(
              color: Colors.white.withOpacity(.3),
              margin: EdgeInsets.zero,
              child: const HourlyWeatherDetails()),
          SizedBox(
            height: constraints.maxHeight * .03,
          ),
          TransparentCard(
              color: Colors.white.withOpacity(.3),
              margin: EdgeInsets.zero,
              child: const DayWiseWeatherDetails())
        ],
      ),
    );
  }
}
