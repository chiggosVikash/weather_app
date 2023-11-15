import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/weather/presentation/widgets/daywise_weather_details.dart';
import 'package:weather_app/features/weather/presentation/widgets/hourly_weather_details.dart';
import 'package:weather_app/utils/services/location_service/models/location_model.dart';
import 'package:weather_app/widgets/transparent_card.dart';

class WeatherDetails extends ConsumerWidget {
  final BoxConstraints constraints;
  final LocationModel _locationModel;
  const WeatherDetails(
      {super.key,
      required this.constraints,
      required LocationModel locationModel})
      : _locationModel = locationModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              child: HourlyWeatherDetails(
                locationModel: _locationModel,
              )),
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
