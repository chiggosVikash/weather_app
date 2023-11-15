import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/utils/services/location_service/models/location_model.dart';

import '../../../../utils/services/location_service/location_service.dart';
import '../../../../utils/services/location_service/location_service_impl.dart';

final locationProvider = AsyncNotifierProvider<LocationP, LocationModel?>(() {
  return LocationP();
});

class LocationP extends AsyncNotifier<LocationModel?> {
  final LocationService _locationSerive = LocationServiceImpl();
  @override
  FutureOr<LocationModel?> build() {
    return null;
  }

  Future<LocationModel?> getCurrentLocation() async {
    try {
      if (state.value != null) {
        return state.value;
      }
      final location = await _locationSerive.getCurrentLocation();
      state = AsyncData(location);
      return location;
    } catch (error, stackTrace) {
      state = AsyncError(error, stackTrace);
      rethrow;
    }
  }
}
