import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/extension/context_extension.dart';
import 'package:weather_app/features/weather/data/models/hourly_weather_forcast_model.dart';
import 'package:weather_app/features/weather/domain/use_cases/weather_icon_usecase.dart';
import 'package:weather_app/features/weather/presentation/providers/hourly_weather_forcast_provider.dart';
import 'package:weather_app/utils/extensions/date_time_format_extension.dart';

class DayWiseWeatherDetails extends ConsumerWidget {
  final List<HourlyWeatherForcastModel> _hourlyWeatherData;
  const DayWiseWeatherDetails(
      {super.key, required List<HourlyWeatherForcastModel> hourlyWeatherData})
      : _hourlyWeatherData = hourlyWeatherData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dayWiseForcastData = ref
        .watch(hourlyWeatherProvider.notifier)
        .getDaysWiseForcastReport(_hourlyWeatherData);
    return Container(
      padding: EdgeInsets.symmetric(vertical: context.height * .02),
      child: Column(
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Wrap(
              spacing: context.width * .07,
              children: List.generate(dayWiseForcastData.length, (index) {
                return Column(
                  children: [
                    Text(
                      dayWiseForcastData[index].textDate.dayDateFormat,
                    ),
                    Image.asset(
                      WeatherIconUsecase.getIcon(
                          dayWiseForcastData[index].weather[0].icon),
                      width: context.width * .1,
                    ),
                    Text(
                      "${dayWiseForcastData[index].main.temp.toStringAsFixed(1)}° C",
                      style: GoogleFonts.abyssinicaSil(
                          fontSize: ((context.height + context.width) *
                                  context.aspectRatio) *
                              .033),
                    ),
                    Text(
                      " ${dayWiseForcastData[index].wind.speed} m/s",
                      style: GoogleFonts.openSans(
                          fontSize: ((context.height + context.width) *
                                  context.aspectRatio) *
                              .018),
                    )
                  ],
                );
              }),
            ),
          )
        ],
      ),
    );
  }
}
