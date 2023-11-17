import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/databases/local_database/models/db_weather_model.dart';
import 'package:weather_app/extension/context_extension.dart';
import 'package:weather_app/features/weather/domain/use_cases/weather_icon_usecase.dart';

class CitiesContent extends ConsumerWidget {
  final DBWeatherModel _dbWeatherModel;
  const CitiesContent({super.key, required DBWeatherModel dbWeatherModel})
      : _dbWeatherModel = dbWeatherModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                    _dbWeatherModel.locality!,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Text(_dbWeatherModel.weatherCondition!),
                  SizedBox(
                    height: context.height * .01,
                  ),
                  Text.rich(TextSpan(children: [
                    const TextSpan(text: "Humidity "),
                    TextSpan(text: "${_dbWeatherModel.humidity}%")
                  ])),
                  Text.rich(TextSpan(children: [
                    const TextSpan(text: "Wind "),
                    TextSpan(text: "${_dbWeatherModel.windSpeed} m/s")
                  ]))
                ],
              ),
            ),
            SizedBox(
              width: context.width * .2,
              child: Column(
                children: [
                  Image.asset(
                    WeatherIconUsecase.getIcon(_dbWeatherModel.icon!),
                    width: context.width * .12,
                    fit: BoxFit.contain,
                  ),
                  Row(
                    children: [
                      Text(
                        "${_dbWeatherModel.temperature}",
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
