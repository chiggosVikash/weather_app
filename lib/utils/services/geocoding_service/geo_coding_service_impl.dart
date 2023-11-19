import 'package:weather_app/utils/services/geocoding_service/geo_coding_service.dart';
import 'package:geocoding/geocoding.dart' as geocoding;

class GeocodingServiceImpl<T> implements GeocodingService<T> {
  @override
  Future<T> getCityNameFromCoordinates(
      {required double latitude,
      required double longitude,
      String localeIdentifier = "IN"}) async {
    final city = await geocoding.placemarkFromCoordinates(
      latitude,
      longitude,
      localeIdentifier: localeIdentifier,
    );

    return city as T;
  }

  @override
  Future<T> getCoordinatesFromCityOrLocalAreaName(
      {required String cityOrLocalAreaName,
      String localeIdentifier = "IN"}) async {
    try {
      final coordinates = await geocoding.locationFromAddress(
        cityOrLocalAreaName,
        localeIdentifier: localeIdentifier,
      );
      return coordinates as T;
    } catch (e) {
      rethrow;
    }
  }
}
