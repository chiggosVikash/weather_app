import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/weather/presentation/providers/hourly_weather_forcast_provider.dart';
import 'package:weather_app/features/weather/presentation/widgets/daywise_weather_details.dart';
import 'package:weather_app/features/weather/presentation/widgets/hourly_weather_details.dart';
import 'package:weather_app/utils/services/location_service/models/location_model.dart';
import 'package:weather_app/widgets/transparent_card.dart';

class WeatherDetails extends ConsumerStatefulWidget {
  final BoxConstraints constraints;
  final LocationModel _locationModel;
  const WeatherDetails(
      {super.key,
      required this.constraints,
      required LocationModel locationModel})
      : _locationModel = locationModel;

  @override
  ConsumerState<WeatherDetails> createState() => _WeatherDetailsState();
}

class _WeatherDetailsState extends ConsumerState<WeatherDetails> {
  @override
  void initState() {
    super.initState();
    Future(() async {
      await ref.read(hourlyWeatherProvider.notifier).get5DayWeatherForcast(
          lat: widget._locationModel.latitude,
          lon: widget._locationModel.longitude);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: widget.constraints.maxWidth * .03,
      ),
      child: Consumer(
        builder: (context, ref, child) {
          final hourlyData = ref.watch(hourlyWeatherProvider);

          return hourlyData.when(
              data: (forcastsData) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: widget.constraints.maxHeight * .03,
                    ),
                    TransparentCard(
                        color: Colors.white.withOpacity(.3),
                        margin: EdgeInsets.zero,
                        child: HourlyWeatherDetails(
                          hourlyWeatherData: forcastsData,
                        )),
                    SizedBox(
                      height: widget.constraints.maxHeight * .03,
                    ),
                    TransparentCard(
                        color: Colors.white.withOpacity(.3),
                        margin: EdgeInsets.zero,
                        child: DayWiseWeatherDetails(
                          hourlyWeatherData: forcastsData,
                        ))
                  ],
                );
              },
              error: (e, st) => Center(
                    child: Text("Error $e"),
                  ),
              loading: () => const Center(
                    child: Text("Loading.."),
                  ));
        },
      ),
    );
  }
}
