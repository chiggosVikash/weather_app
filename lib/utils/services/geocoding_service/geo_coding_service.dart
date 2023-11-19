abstract class GeocodingService<T> {
  Future<T> getCityNameFromCoordinates(
      {required double latitude,
      required double longitude,
      String localeIdentifier = "IN"});

  Future<T> getCoordinatesFromCityOrLocalAreaName(
      {required String cityOrLocalAreaName, String localeIdentifier = "IN"});
}
