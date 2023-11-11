import 'package:flutter/material.dart';
import 'package:weather_app/extension/context_extension.dart';
import 'package:weather_app/widgets/icon_with_text.dart';

class HumidityWindNdFeelsLikeData extends StatelessWidget {
  const HumidityWindNdFeelsLikeData({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconWithText(
            width: context.width * .3,
            icon: Icon(
              Icons.water_drop_outlined,
              color: Colors.grey.shade200,
            ),
            title: "Humidity",
            value: "75%"),
        IconWithText(
            width: context.width * .3,
            icon: Icon(Icons.wind_power, color: Colors.grey.shade200),
            title: "Wind",
            value: "4.5 Km/h"),
        IconWithText(
            width: context.width * .3,
            icon: Icon(Icons.thermostat_auto_outlined,
                color: Colors.grey.shade200),
            title: "Feels Like",
            value: "20°")
      ],
    );
  }
}
