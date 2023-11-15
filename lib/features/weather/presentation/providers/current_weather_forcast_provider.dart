import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/features/weather/data/models/current_weather_forcast_model.dart';
import 'package:weather_app/features/weather/presentation/providers/geo_coding_provider.dart';
import 'package:weather_app/features/weather/presentation/providers/location_provider.dart';
import '../../domain/use_cases/weather_forcast_usecase.dart';
part 'current_weather_forcast_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentWeatherForcastP extends _$CurrentWeatherForcastP {
  final _weatherUseCase = WeatherFocastUseCase();

  @override
  Future<CurrentWeatherForcastModel?> build() {
    return Future.value(null);
  }

  Future<void> getCurrentWeather({bool isRefresh = false}) async {
    if (!isRefresh) {
      state = const AsyncLoading();
    }

    try {
      final location =
          await ref.read(locationProvider.notifier).getCurrentLocation();
      final placeMarks = await ref
// ignore: avoid_manual_providers_as_generated_provider_dependency
          .read(geocodingProvider.notifier)
          .getAddressByCoordinates(
              latitude: location!.latitude, longitude: location.longitude);
      final weather = await _weatherUseCase.getCurrentWeatherForcast(
          lat: location.latitude, lon: location.longitude);

      if (placeMarks.isNotEmpty) {
        final updatedWeatherData = weather.copyWith(
          coord: location.copyWith(
            locality: placeMarks.first.locality,
            state: placeMarks.first.administrativeArea,
            country: placeMarks.first.country,
            postalCode: placeMarks.first.postalCode,
            street: placeMarks.first.street,
            countryCode: placeMarks.first.isoCountryCode,
          ),
        );
        state = AsyncData(updatedWeatherData);
      } else {
        state = AsyncData(weather);
      }
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      rethrow;
    }
  }
}
