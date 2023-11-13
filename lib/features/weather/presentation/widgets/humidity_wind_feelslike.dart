import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/extension/context_extension.dart';
import 'package:weather_app/features/weather/data/models/main_model.dart';
import 'package:weather_app/features/weather/data/models/wind_model.dart';
import 'package:weather_app/widgets/icon_with_text.dart';

class HumidityWindNdFeelsLikeData extends ConsumerWidget {
  final MainModel _weatherCondition;
  final WindModel _wind;
  const HumidityWindNdFeelsLikeData({
    super.key,
    required MainModel weatherCondition,
    required WindModel wind,
  })  : _weatherCondition = weatherCondition,
        _wind = wind;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        IconWithText(
            width: context.width * .3,
            icon: Icon(
              Icons.water_drop_outlined,
              color: Colors.grey.shade200,
            ),
            title: "Humidity",
            value: "${_weatherCondition.humidity}%"),
        IconWithText(
            width: context.width * .3,
            icon: Icon(Icons.wind_power, color: Colors.grey.shade200),
            title: "Wind",
            value: "${_wind.speed} m/s"),
        IconWithText(
            width: context.width * .3,
            icon: Icon(Icons.thermostat_auto_outlined,
                color: Colors.grey.shade200),
            title: "Feels Like",
            value: "${_weatherCondition.feelsLike}°")
      ],
    );
  }
}
