import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/features/weather/data/models/current_weather_forcast_model.dart';
import 'package:weather_app/features/weather/presentation/providers/geo_coding_provider.dart';
import 'package:weather_app/features/weather/presentation/providers/location_provider.dart';
import '../../../../databases/local_database/models/db_weather_model.dart';
import '../../../../utils/services/location_service/models/location_model.dart';
import '../../domain/use_cases/weather_forcast_usecase.dart';

/// Provider for fetching the current weather forecast.
/// It is an [AsyncNotifierProvider] that provides an instance of [CurrentWeatherForcastP].
/// The provider returns a [CurrentWeatherForcastModel] object or null.
final currentWeatherForcastPProvider =
    AsyncNotifierProvider<CurrentWeatherForcastP, CurrentWeatherForcastModel?>(
        () => CurrentWeatherForcastP());

class CurrentWeatherForcastP
    extends AsyncNotifier<CurrentWeatherForcastModel?> {
  final _weatherUseCase = WeatherFocastUseCase();

  @override
  Future<CurrentWeatherForcastModel?> build() {
    return Future.value(null);
  }

  /// Retrieves the current weather forecast for a given location.
  ///
  /// If [isRefresh] is set to `true`, the weather data will be refreshed even if it is already available.
  /// If [location] is provided, it will be used as the target location for weather forecast retrieval.
  /// If [location] is not provided, the current device location will be used.
  ///
  /// Throws an exception if the current location cannot be obtained.
  /// Throws an exception if the place marks (address information) for the location are empty.
  ///
  /// Returns a [Future] that resolves to a [CurrentWeatherForcastModel] representing the current weather forecast.

  Future<CurrentWeatherForcastModel> getCurrentWeather(
      {bool isRefresh = false, LocationModel? location}) async {
    if (!isRefresh) {
      state = const AsyncLoading();
    }

    if (kDebugMode) {
      print("Location ${location?.latitude} ${location?.longitude}");
    }

    try {
      location ??=
          await ref.read(locationProvider.notifier).getCurrentLocation();

      if (location == null) {
        throw Exception("Failed to get current location");
      }

      final placeMarks = await ref
// ignore: avoid_manual_providers_as_generated_provider_dependency
          .read(geocodingProvider.notifier)
          .getAddressByCoordinates(
              fetchAgain: true,
              latitude: location.latitude,
              longitude: location.longitude);

      final weather = await _weatherUseCase.getCurrentWeatherForcast(
          lat: location.latitude, lon: location.longitude);

      if (placeMarks.isEmpty) throw Exception("Place marks is empty");

      final updatedWeatherData = weather.copyWith(
        coord: location.copyWith(
          subLocality: placeMarks.first.subLocality,
          locality: placeMarks.first.locality,
          state: placeMarks.first.administrativeArea,
          country: placeMarks.first.country,
          postalCode: placeMarks.first.postalCode,
          street: placeMarks.first.street,
          countryCode: placeMarks.first.isoCountryCode,
        ),
      );
      state = AsyncData(updatedWeatherData);

      return state.value!;
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      rethrow;
    }
  }

  /// Saves the current weather forecast in the local database.
  ///
  /// The [currentWeatherModel] parameter represents the current weather forecast model
  /// containing information such as location, temperature, humidity, wind speed, and weather condition.
  ///
  /// Throws an [Exception] if there is an error while saving the weather forecast in the local database.
  Future<void> saveWheatherInLocalDB(
      CurrentWeatherForcastModel currentWeatherModel) async {
    try {
      if (kDebugMode) {
        print(
            "Current weather ${currentWeatherModel.coord.locationName()} ${currentWeatherModel.coord.latitude} ${currentWeatherModel.coord.longitude}");
      }
      await _weatherUseCase.saveWheatherInLocalDB(DBWeatherModel(
        latitude: currentWeatherModel.coord.latitude,
        longitude: currentWeatherModel.coord.longitude,
        locality: currentWeatherModel.coord.locationName(),
        weatherCondition: currentWeatherModel.weathers.first.main,
        temperature: currentWeatherModel.main.temp,
        humidity: currentWeatherModel.main.humidity,
        windSpeed: currentWeatherModel.wind.speed,
        icon: currentWeatherModel.weathers.first.icon,
      ));
    } catch (e) {
      throw Exception("SaveWeatherInLocalDBError $e");
    }
  }
}
