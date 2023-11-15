import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/utils/services/geocoding_service/geo_coding_service.dart';

import '../../../../utils/services/geocoding_service/geo_coding_service_impl.dart';

final geocodingProvider =
    AsyncNotifierProvider<GeoCodingP, List<Placemark>>(() {
  return GeoCodingP();
});

class GeoCodingP extends AsyncNotifier<List<Placemark>> {
  final GeocodingService _geocodingService = GeocodingServiceImpl();

  @override
  FutureOr<List<Placemark>> build() async {
    return [];
  }

  Future<List<Placemark>> getAddressByCoordinates(
      {required double latitude, required double longitude}) async {
    try {
      if (state.value != null && state.value!.isNotEmpty) {
        return [...state.value!];
      }
      final placeMarks = await _geocodingService.getCityNameFromCoordinates(
          latitude: latitude, longitude: longitude);
      state = AsyncData(placeMarks as List<Placemark>);
      return placeMarks;
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      rethrow;
    }
  }
}
