import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../domain/use_cases/permission_handler_user_case.dart';
part 'permission_handler_provider.g.dart';

@Riverpod(keepAlive: true)
class PermissionHandlerP extends _$PermissionHandlerP {
  final _permissionHandler = PermissionHandlerUseCase();
  @override
  Future<bool> build() async {
    return false;
  }

  /// Returns a [Future] that completes with a [bool] indicating whether the location permission is granted or not.
  /// Throws an [Exception] if there is an error while checking the location permission status.
  /// Throws an [Exception] if the location permission is not granted.
  Future<void> locationPermissionStatus() async {
    final locationServiceStatus =
        await _permissionHandler.checkLocationServiceStatus();
    if (locationServiceStatus == false) {
      throw Exception("Location Service is not enabled");
    }

    final status = await _permissionHandler.checkLocationPermissionStatus();

    if (status == false) {
      final modefiedStatus =
          await _permissionHandler.requestLocationPermission();
      if (modefiedStatus == false) {
        throw Exception("Location Permission is not granted");
      }
    }
  }
}
