import 'package:permission_handler/permission_handler.dart';
import 'package:weather_app/features/permission_handler/data/data_source/permission_data_source.dart';

class PermissionDataSourceImpl implements PermissionDataSource {
  /// Checks the status of the location permission.
  /// Returns a [Future] that completes with a [bool] value indicating whether the permission is granted or not.
  /// Throws an [Exception] if there is an error while checking the permission status.
  @override
  Future<bool> checkLocationPermissionStatus() async {
    try {
      final permissionStatus = await Permission.location.status;
      if (permissionStatus.isGranted) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("Location Permission Error $e");
    }
  }

  /// Requests location permission and returns a Future<bool> indicating whether the permission was granted or not.
  /// Throws an Exception if there was an error while requesting the permission.
  @override
  Future<bool> requestLocationPermission() async {
    try {
      final permissionStatus = await Permission.location.request();
      if (permissionStatus.isPermanentlyDenied) {
        throw Exception("Location Permission is permanently denied");
      }
      if (permissionStatus.isGranted) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }

  /// Checks the status of the location service permission.
  /// Returns a [Future] that completes with a [bool] indicating whether the location service is enabled or not.
  /// Throws an [Exception] if there is an error while checking the location service status.
  @override
  Future<bool> checkLocationServiceStatus() async {
    try {
      final serviceStatus = await Permission.location.serviceStatus;
      if (serviceStatus.isEnabled) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw Exception("Location Service Error $e");
    }
  }
}
