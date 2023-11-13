import 'package:weather_app/utils/services/geocoding_service/geo_coding_service.dart';
import 'package:geocoding/geocoding.dart';

class GeocodingServiceImpl<T> implements GeocodingService<T> {
  @override
  Future<T> getCityNameFromCoordinates(
      {required double latitude,
      required double longitude,
      String localeIdentifier = "IN"}) async {
    final city = await placemarkFromCoordinates(
      latitude,
      longitude,
    );

    return city as T;
  }
}
