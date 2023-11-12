import 'package:flutter/material.dart';
import 'package:weather_app/extension/context_extension.dart';
import 'package:weather_app/models/weather_type_model.dart';

class CitiesContent extends StatelessWidget {
  final WeatherTypeDModel weatherInfoData;
  const CitiesContent({super.key, required this.weatherInfoData});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(
              width: context.width * .7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    weatherInfoData.location,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(weatherInfoData.weatherType),
                  SizedBox(
                    height: context.height * .01,
                  ),
                  const Text.rich(TextSpan(children: [
                    TextSpan(text: "Humidity "),
                    TextSpan(text: "75%")
                  ])),
                  const Text.rich(TextSpan(children: [
                    TextSpan(text: "Wind "),
                    TextSpan(text: "4.5 km/h")
                  ]))
                ],
              ),
            ),
            SizedBox(
              width: context.width * .2,
              child: Column(
                children: [
                  Image.asset(
                    weatherInfoData.icon,
                    width: context.width * .12,
                    fit: BoxFit.contain,
                  ),
                  Row(
                    children: [
                      Text(
                        "25",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Baseline(
                          baseline: 3.0,
                          baselineType: TextBaseline.alphabetic,
                          child: Text(
                            "°C",
                            style: Theme.of(context).textTheme.bodyLarge,
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}
