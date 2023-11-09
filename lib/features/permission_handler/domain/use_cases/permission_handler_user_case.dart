import 'package:weather_app/features/permission_handler/data/data_source/permission_data_source_impl.dart';
import 'package:weather_app/features/permission_handler/data/repo/permission_handler_repo_impl.dart';

import '../repo/permission_handler_repo.dart';

/// This class represents the use case for handling location permissions.
/// It provides methods to check the location permission status and request location permission.
/// Uses [PermissionHandlerRepo] to interact with the data layer.
class PermissionHandlerUseCase {
  final PermissionHandlerRepo _permissionHandlerRepo =
      PermissionHandlerRepoImpl(PermissionDataSourceImpl());

  /// Returns a [Future] that completes with a [bool] indicating whether the location permission is granted or not.
  Future<bool> checkLocationPermissionStatus() async {
    return _permissionHandlerRepo.checkLocationPermissionStatus();
  }

  /// Requests the location permission and returns a [Future] that completes with a [bool] indicating whether the permission is granted or not.
  Future<bool> requestLocationPermission() {
    return _permissionHandlerRepo.requestLocationPermission();
  }
}
