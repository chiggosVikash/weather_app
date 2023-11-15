import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/extension/context_extension.dart';
import 'package:weather_app/features/weather/presentation/providers/hourly_weather_forcast_provider.dart';
import 'package:weather_app/utils/services/location_service/models/location_model.dart';

class DayWiseWeatherDetails extends ConsumerWidget {
  final LocationModel _locationModel;
  const DayWiseWeatherDetails({super.key, required LocationModel locationModel})
      : _locationModel = locationModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(hourlyWeatherProvider(_locationModel));
    final dayWiseForcastData = ref
        .watch(hourlyWeatherProvider(_locationModel).notifier)
        .getDaysWiseForcastReport();
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
                      dayWiseForcastData[index].onlyDate(),
                    ),
                    Image.asset(
                      "assets/heavy_clouds.png",
                      width: context.width * .1,
                    ),
                    Text(
                      "${dayWiseForcastData[index].main.temp.toStringAsFixed(1)}°",
                      style: GoogleFonts.abyssinicaSil(
                          fontSize: ((context.height + context.width) *
                                  context.aspectRatio) *
                              .033),
                    ),
                    Text(
                      " 1-5 \nkm/h",
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
