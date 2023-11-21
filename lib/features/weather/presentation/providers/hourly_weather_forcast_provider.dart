import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/features/weather/data/models/hourly_weather_forcast_model.dart';
import 'package:weather_app/utils/extensions/provider_extension.dart';
import '../../../../utils/services/location_service/models/location_model.dart';
import '../../domain/use_cases/weather_forcast_usecase.dart';

/// A provider that returns an [AsyncValue] of a list of [HourlyWeatherForcastModel] for a given [LocationModel].
///
/// The provider is created using the [AsyncNotifierProvider.family] constructor and is set to autoDispose.
/// It returns an instance of [HourlyWeatherForcastP].
final hourlyWeatherProvider = AsyncNotifierProvider.autoDispose<
    HourlyWeatherForcastP, List<HourlyWeatherForcastModel>>(() {
  return HourlyWeatherForcastP();
});

class HourlyWeatherForcastP
    extends AutoDisposeAsyncNotifier<List<HourlyWeatherForcastModel>> {
  final _weatherForcastUsecase = WeatherFocastUseCase();
  @override
  FutureOr<List<HourlyWeatherForcastModel>> build() async {
    ref.cacheFor(const Duration(minutes: 5));

    return [];
  }

  /// Retrieves the 5-day weather forecast for the given latitude and longitude.
  ///
  /// The [lat] parameter represents the latitude of the location.
  /// The [lon] parameter represents the longitude of the location.
  /// The [isRefresh] parameter indicates whether to force a refresh of the data.
  ///
  /// Returns a [Future] that resolves to a list of [HourlyWeatherForcastModel].
  /// If the [state] value is not null and not empty, it returns a copy of the current state.
  /// Otherwise, it calls the [_weatherForcastUsecase.get5DayWeatherForcast] method
  /// to fetch the forecast data and updates the [state] accordingly.
  /// If an error occurs, it sets the [state] to [AsyncError] and returns an empty list.
  Future<List<HourlyWeatherForcastModel>> get5DayWeatherForcast(
      {required double lat,
      required double lon,
      bool isRefresh = false}) async {
    try {
      if (state.value != null && state.value!.isNotEmpty) {
        return [...state.value!];
      }

      final forcastData = await _weatherForcastUsecase.get5DayWeatherForcast(
          lat: lat, lon: lon);
      state = AsyncData(forcastData);
      return forcastData;
    } catch (error, stackTrace) {
      if (kDebugMode) {
        rethrow;
      }
      state = AsyncError(error, stackTrace);
      return [];
    }
  }

  /// Retrieves the today's weather forecast for every 3 hours.
  ///
  /// Takes in a list of [HourlyWeatherForcastModel] and returns a filtered list
  /// containing the weather forecast for today at every 3-hour interval.
  ///

  List<HourlyWeatherForcastModel> getTodayWeatherForcastOfEvery3Hrs(
      List<HourlyWeatherForcastModel> forcasts) {
    return _weatherForcastUsecase.getTodayWeatherForcast(forcasts);
  }

  /// Retrieves the days-wise forecast report based on the provided list of hourly weather forecasts.
  ///
  /// The [forcasts] parameter is a list of [HourlyWeatherForcastModel] objects representing the hourly weather forecasts.
  /// Returns a list of [HourlyWeatherForcastModel] objects representing the days-wise forecast report.
  List<HourlyWeatherForcastModel> getDaysWiseForcastReport(
      List<HourlyWeatherForcastModel> forcasts) {
    return _weatherForcastUsecase.getDaysWiseForcastReport(forcasts);
  }
}
