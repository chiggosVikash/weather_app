import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/extension/context_extension.dart';

import '../../domain/use_cases/weather_icon_usecase.dart';
import '../providers/current_weather_forcast_provider.dart';
import 'humidity_wind_feelslike.dart';

class CurrentWeatherDetails extends ConsumerWidget {
  final BoxConstraints constraints;
  const CurrentWeatherDetails({super.key, required this.constraints});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(currentWeatherForcastPProvider);
    if (state.hasError) {
      return Center(
        child: Text(state.error.toString()),
      );
    }
    if (state.isLoading || state.value == null) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
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
            "${state.value!.main.inCelcious.toStringAsFixed(1)} °C",
            style: GoogleFonts.alike(
                color: Colors.grey.shade300,
                height: .8,
                fontSize:
                    ((constraints.biggest.height + constraints.biggest.width) *
                            context.aspectRatio) *
                        .09),
          ),
          Row(
            children: [
              Text(
                "${state.value!.weathers.first.main} ",
                style: GoogleFonts.openSans(
                    color: Colors.grey.shade300,
                    fontSize: ((constraints.biggest.height +
                                constraints.biggest.width) *
                            context.aspectRatio) *
                        .03),
              ),
              Image.asset(
                WeatherIconUsecase.getIcon(state.value!.weathers.first.icon),
                width: constraints.maxWidth * .1,
              ),
            ],
          ),
          SizedBox(
            height: constraints.maxHeight * .02,
          ),
          HumidityWindNdFeelsLikeData(
            wind: state.value!.wind,
            weatherCondition: state.value!.main,
          ),
        ],
      ),
    );
  }
}
