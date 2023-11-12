import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/features/permission_handler/data/models/location_model.dart';

import '../../domain/use_cases/permission_handler_user_case.dart';
part 'permission_handler_provider.g.dart';

@Riverpod(keepAlive: true)
class PermissionHandlerP extends _$PermissionHandlerP {
  final _permissionHandler = PermissionHandlerUseCase();
  @override
  Future<LocationModel?> build() async {
    return null;
  }

  Future<void> getLocation() async {
    final status = await _permissionHandler.checkLocationPermissionStatus();

    if (status == false) {
      final modefiedStatus =
          await _permissionHandler.requestLocationPermission();
      if (modefiedStatus == false) {
        throw Exception("Location Permission is not granted");
      }
    }
  }

  Future<void> _fetchCurrenctLocation() async{
    final location = await _permissionHandler.();
    if(location == null){
      throw Exception("Location is null");
    }
  }
}
