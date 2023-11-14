import 'package:weather_app/utils/services/location_service/location_service.dart';
import 'package:weather_app/utils/services/location_service/models/location_model.dart';
import 'package:geolocator/geolocator.dart';
import '../../../features/permission_handler/domain/use_cases/permission_handler_user_case.dart';

class LocationServiceImpl implements LocationService {
  final _permissionHandler = PermissionHandlerUseCase();

  /// Returns the current location of the device as a [LocationModel] object.
  /// Throws an [Exception] if location service or location permission is not enabled.
  /// Uses the [Geolocator] package to get the current position.
  ///
  /// Throws:
  /// - [Exception] if location service is not enabled.
  /// - [Exception] if location permission is not granted.
  ///
  /// Returns:
  /// - [LocationModel] object containing the latitude and longitude of the current location.

  @override
  Future<LocationModel> getCurrentLocation() async {
    try {
      final status = await _permissionHandler.checkLocationServiceStatus();

      if (status == false) {
        throw Exception("Location Service is not enabled");
      }
      final locationPermissionStatus =
          await _permissionHandler.checkLocationPermissionStatus();
      if (locationPermissionStatus == false) {
        final modefiedStatus =
            await _permissionHandler.requestLocationPermission();
        if (modefiedStatus == false) {
          throw Exception("Location Permission is not granted");
        }
      }
      final location = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      return LocationModel(
          latitude: location.latitude, longitude: location.longitude);
    } catch (e) {
      rethrow;
    }
  }
}
