import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/extension/context_extension.dart';
import 'package:weather_app/features/weather/presentation/providers/hourly_weather_forcast_provider.dart';
import 'package:weather_app/utils/extensions/date_time_format_extension.dart';
import 'package:weather_app/utils/services/location_service/models/location_model.dart';

class HourlyWeatherDetails extends ConsumerWidget {
  final LocationModel _locationModel;
  const HourlyWeatherDetails({super.key, required LocationModel locationModel})
      : _locationModel = locationModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hourlyData = ref.watch(hourlyWeatherProvider(_locationModel));
    return hourlyData.when(
        data: (hourlyWeatherData) {
          final hourlyData = ref
              .watch(hourlyWeatherProvider(_locationModel).notifier)
              .getTodayWeatherForcastOfEvery3Hrs(hourlyWeatherData);
          if (hourlyWeatherData.isEmpty) {
            return const Center(
              child: Text("No Data"),
            );
          }
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: context.width * .04,
              children: List.generate(hourlyData.length, (index) {
                return Column(
                  children: [
                    Text(
                      hourlyData[index].textDate.t12hrsTimeFormat,
                    ),
                    Image.asset(
                      "assets/heavy_clouds.png",
                      width: context.width * .1,
                    ),
                    Text(
                      "${hourlyData[index].main.inCelcious.toStringAsFixed(1)}°C",
                      style: GoogleFonts.abyssinicaSil(
                          fontSize: ((context.height + context.width) *
                                  context.aspectRatio) *
                              .03),
                    )
                  ],
                );
              }),
            ),
          );
        },
        error: (error, stackTrace) {
          return const Center(
            child: Text("Error $e"),
          );
        },
        loading: () => const Text("Loading"));
  }
}
