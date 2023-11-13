import 'package:weather_app/features/permission_handler/data/data_source/permission_data_source.dart';
import 'package:weather_app/features/permission_handler/domain/repo/permission_handler_repo.dart';

class PermissionHandlerRepoImpl extends PermissionHandlerRepo {
  final PermissionDataSource _permissionDataSource;
  PermissionHandlerRepoImpl(this._permissionDataSource);
  @override
  Future<bool> checkLocationPermissionStatus() async {
    return _permissionDataSource.checkLocationPermissionStatus();
  }

  @override
  Future<bool> requestLocationPermission() {
    return _permissionDataSource.requestLocationPermission();
  }

  @override
  Future<bool> checkLocationServiceStatus() {
    return _permissionDataSource.checkLocationServiceStatus();
  }
}
