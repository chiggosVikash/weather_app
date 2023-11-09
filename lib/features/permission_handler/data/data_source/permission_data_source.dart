/// Abstract class for handling location permission data source.
abstract class PermissionDataSource {
  /// Returns a Future<bool> indicating whether the location permission is granted or not.
  Future<bool> checkLocationPermissionStatus();

  /// Requests for location permission and returns a Future<bool> indicating whether the permission is granted or not.
  Future<bool> requestLocationPermission();

  /// Returns a Future<bool> indicating whether the location service is enabled or not.
  Future<bool> checkLocationServiceStatus();
}
