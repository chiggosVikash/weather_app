import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../utils/constants/constant.dart';
import '../../../../utils/enums/weathertype_enums.dart';
import '../providers/current_weather_forcast_provider.dart';

class Background extends ConsumerWidget {
  const Background({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Consumer(
      builder: (context, ref, child) {
        final currentData = ref.watch(currentWeatherForcastPProvider);

        return currentData.when(
            loading: () => Container(),
            data: (weatherReport) {
              return Container(
                decoration: BoxDecoration(
                    gradient: Constant.backgroundWeatherGradient(
                        weatherReport!.weatherType())),
              );
            },
            error: (error, stackTrace) => Container(
                  decoration: BoxDecoration(
                      gradient: Constant.backgroundWeatherGradient(
                          WeatherType.sunny)),
                ));
      },
    );
  }
}
