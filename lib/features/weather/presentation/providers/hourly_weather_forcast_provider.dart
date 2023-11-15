import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/features/weather/data/models/hourly_weather_forcast_model.dart';
import 'package:weather_app/utils/extensions/provider_extension.dart';
import '../../../../utils/services/location_service/models/location_model.dart';
import '../../domain/use_cases/weather_forcast_usecase.dart';

/// A provider that returns an [AsyncValue] of a list of [HourlyWeatherForcastModel] for a given [LocationModel].
///
/// The provider is created using the [AsyncNotifierProvider.family] constructor and is set to autoDispose.
/// It returns an instance of [HourlyWeatherForcastP].
final hourlyWeatherProvider = AsyncNotifierProvider.family.autoDispose<
    HourlyWeatherForcastP, List<HourlyWeatherForcastModel>, LocationModel>(() {
  return HourlyWeatherForcastP();
});

class HourlyWeatherForcastP extends AutoDisposeFamilyAsyncNotifier<
    List<HourlyWeatherForcastModel>, LocationModel> {
  final _weatherForcastUsecase = WeatherFocastUseCase();
  @override
  FutureOr<List<HourlyWeatherForcastModel>> build(
      LocationModel locationData) async {
    ref.cacheFor(const Duration(minutes: 5));

    return get5DayWeatherForcast(
        lat: locationData.latitude, lon: locationData.longitude);
  }

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
      return forcastData;
    } catch (error, stackTrace) {
      if (kDebugMode) {
        rethrow;
      }
      state = AsyncError(error, stackTrace);
      return [];
    }
  }

  List<HourlyWeatherForcastModel> getTodayWeatherForcastOfEvery3Hrs(
      List<HourlyWeatherForcastModel> forcasts) {
    return _weatherForcastUsecase.getTodayWeatherForcast(forcasts);
  }
}
