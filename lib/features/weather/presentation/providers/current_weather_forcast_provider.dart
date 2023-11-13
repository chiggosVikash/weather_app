import 'package:geocoding/geocoding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/features/weather/data/models/current_weather_forcast_model.dart';
import 'package:weather_app/utils/services/geocoding_service/geo_coding_service.dart';

import '../../../../utils/services/geocoding_service/geo_coding_service_impl.dart';
import '../../../../utils/services/location_service/location_service.dart';
import '../../../../utils/services/location_service/location_service_impl.dart';
import '../../domain/use_cases/weather_forcast_usecase.dart';
part 'current_weather_forcast_provider.g.dart';

@riverpod
class CurrentWeatherForcastP extends _$CurrentWeatherForcastP {
  final LocationService _locationService = LocationServiceImpl();
  final _weatherUseCase = WeatherFocastUseCase();
  final GeocodingService<List<Placemark>> _geocodingService =
      GeocodingServiceImpl<List<Placemark>>();

  @override
  Future<CurrentWeatherForcastModel?> build() {
    return Future.value(null);
  }

  Future<void> getCurrentWeather({bool isRefresh = false}) async {
    if (!isRefresh) {
      state = const AsyncValue.loading();
    }

    try {
      final location = await _locationService.getCurrentLocation();
      final placeMarks = await _geocodingService.getCityNameFromCoordinates(
          latitude: location.latitude, longitude: location.longitude);

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
        state = AsyncValue.data(updatedWeatherData);
      } else {
        state = AsyncValue.data(weather);
      }
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
      rethrow;
    }
  }
}
