/// Abstract class for handling location permission related operations.
///
/// This class defines two methods for checking and requesting location permission.
abstract class PermissionHandlerRepo {
  Future<bool> checkLocationPermissionStatus();
  Future<bool> requestLocationPermission();
}
