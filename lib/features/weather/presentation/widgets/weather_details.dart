import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/extension/context_extension.dart';
import 'package:weather_app/features/weather/presentation/widgets/daywise_weather_details.dart';
import 'package:weather_app/features/weather/presentation/widgets/hourly_weather_details.dart';
import 'package:weather_app/features/weather/presentation/widgets/humidity_wind_feelslike.dart';
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
            height: constraints.maxHeight * .02,
          ),
          Text(
            "30°",
            style: GoogleFonts.alike(
                color: Colors.grey.shade300,
                height: .8,
                fontSize:
                    ((constraints.biggest.height + constraints.biggest.width) *
                            context.aspectRatio) *
                        .18),
          ),
          Row(
            children: [
              Text(
                "Sunny",
                style: GoogleFonts.openSans(
                    color: Colors.grey.shade300,
                    fontSize: ((constraints.biggest.height +
                                constraints.biggest.width) *
                            context.aspectRatio) *
                        .03),
              ),
              Image.asset(
                "assets/sunny.png",
                width: constraints.maxWidth * .1,
              ),
            ],
          ),
          SizedBox(
            height: constraints.maxHeight * .02,
          ),
          const HumidityWindNdFeelsLikeData(),
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
