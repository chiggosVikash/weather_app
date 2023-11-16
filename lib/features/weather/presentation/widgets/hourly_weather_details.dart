import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/extension/context_extension.dart';
import 'package:weather_app/features/weather/data/models/hourly_weather_forcast_model.dart';
import 'package:weather_app/features/weather/domain/use_cases/weather_icon_usecase.dart';
import 'package:weather_app/features/weather/presentation/providers/hourly_weather_forcast_provider.dart';
import 'package:weather_app/utils/extensions/date_time_format_extension.dart';

class HourlyWeatherDetails extends ConsumerWidget {
  final List<HourlyWeatherForcastModel> _hourlyWeatherData;
  const HourlyWeatherDetails({
    required List<HourlyWeatherForcastModel> hourlyWeatherData,
    super.key,
  }) : _hourlyWeatherData = hourlyWeatherData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hourlyData = ref
        .watch(hourlyWeatherProvider.notifier)
        .getTodayWeatherForcastOfEvery3Hrs(_hourlyWeatherData);
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
                WeatherIconUsecase.getIcon(hourlyData[index].weather[0].icon),
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
  }
}
