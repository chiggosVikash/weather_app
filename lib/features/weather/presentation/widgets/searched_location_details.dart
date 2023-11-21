import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/features/weather/presentation/providers/geo_coding_provider.dart';
import 'package:weather_app/features/weather/presentation/screens/individual_weather_info.dart';

class SearchedLocationDetails extends ConsumerWidget {
  const SearchedLocationDetails({
    super.key,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchedLocation = ref.watch(geocodingProvider);

    return searchedLocation.when(
        data: (locationData) {
          return InkWell(
            onTap: () {
              Navigator.pushNamedAndRemoveUntil(
                  context,
                  "/",
                  arguments: IndividualWeatherInfoArgs(
                    longitude: locationData.longitude,
                    latitude: locationData.latitude,
                    placeMarks: locationData.placeMarks,
                  ),
                  (route) => false);
            },
            child: Card(
              child: ListTile(
                title: Text("${locationData.placeMarks.first.subLocality}"),
                subtitle: Text("${locationData.placeMarks.first.locality}"),
              ),
            ),
          );
        },
        error: (e, st) {
          return Center(
            child: Text("Error $e"),
          );
        },
        loading: () => const Center(
              child: RepaintBoundary(child: CircularProgressIndicator()),
            ));
  }
}
