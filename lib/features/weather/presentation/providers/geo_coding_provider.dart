import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:weather_app/features/weather/data/models/geo_coding_model.dart';
import 'package:weather_app/utils/services/geocoding_service/geo_coding_service.dart';

import '../../../../utils/services/geocoding_service/geo_coding_service_impl.dart';

/// A provider for geocoding functionality.
///
/// This provider is responsible for retrieving geocoding data
/// and converting it into a [GeocodingModel] object.
final geocodingProvider = AsyncNotifierProvider<GeoCodingP, GeocodingModel>(() {
  return GeoCodingP();
});

class GeoCodingP extends AsyncNotifier<GeocodingModel> {
  final GeocodingService _geocodingService = GeocodingServiceImpl();

  @override
  FutureOr<GeocodingModel> build() async {
    return const GeocodingModel(placeMarks: [], latitude: 0.0, longitude: 0.0);
  }

  /// Retrieves the address information (Placemark) based on the given latitude and longitude coordinates.
  ///
  /// If the [state] value is not null and not empty, it returns a copy of the existing [state] value.
  /// Otherwise, it calls the [_geocodingService.getCityNameFromCoordinates] method to fetch the city name from the coordinates.
  /// The fetched Placemark data is then stored in the [state] variable as an [AsyncData] object.
  ///
  /// If an error occurs during the process, the [state] variable is updated with the error information using [AsyncError],
  /// and the error is rethrown.
  ///
  /// Returns a [Future] that completes with a list of [Placemark] objects representing the address information.
  Future<List<Placemark>> getAddressByCoordinates(
      {required double latitude,
      required double longitude,
      bool fetchAgain = false}) async {
    try {
      if (fetchAgain == false) {
        if (state.value != null && state.value!.placeMarks.isNotEmpty) {
          return [...state.value!.placeMarks];
        }
      }
      state = const AsyncLoading();

      final placeMarks = await _geocodingService.getCityNameFromCoordinates(
          latitude: latitude, longitude: longitude);
      state = AsyncData(state.value!.copyWith(
        latitude: latitude,
        longitude: longitude,
        placeMarks: placeMarks,
      ));
      return placeMarks;
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      rethrow;
    }
  }

  /// Retrieves the coordinates of a location based on the provided address.
  ///
  /// The [address] parameter specifies the address for which the coordinates are to be retrieved.
  /// The [localeIdentifier] parameter specifies the locale identifier for the address. If not provided, the default value is "IN".
  ///
  /// Returns a [Future] that resolves to a list of [Location] objects containing the latitude and longitude coordinates.
  /// Throws an error if the coordinates cannot be retrieved.
  Future<Location> getCoordinatesByAddress(
      {required String address, String? localeIdentifier}) async {
    try {
      if (address.isEmpty) {
        throw Exception("Address cannot be empty");
      } else if (address.length < 5) {
        throw Exception("Address should be atleast 5 characters long");
      }
      final List<Location> coordinates =
          await _geocodingService.getCoordinatesFromCityOrLocalAreaName(
              cityOrLocalAreaName: address,
              localeIdentifier: localeIdentifier ?? "IN");

      return coordinates.first;
    } catch (error) {
      rethrow;
    }
  }
}
