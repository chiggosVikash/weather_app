abstract class GeocodingService<T> {
  Future<T> getCityNameFromCoordinates(
      {required double latitude,
      required double longitude,
      String localeIdentifier = "IN"});
}
