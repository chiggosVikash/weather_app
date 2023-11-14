import 'package:geocoding/geocoding.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/features/weather/data/models/current_weather_forcast_model.dart';
import 'package:weather_app/utils/services/geocoding_service/geo_coding_service.dart';

import '../../../../utils/services/geocoding_service/geo_coding_service_impl.dart';
import '../../../../utils/services/location_service/location_service.dart';
import '../../../../utils/services/location_service/location_service_impl.dart';
import '../../domain/use_cases/weather_forcast_usecase.dart';
part 'current_weather_forcast_provider.g.dart';

@Riverpod(keepAlive: true)
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
      state = const AsyncLoading();
    }

    try {
      print("Location Fetching ${DateTime.now()}");
      final location = await _locationService.getCurrentLocation();
      print("Location Fetching End ${DateTime.now()}");
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
