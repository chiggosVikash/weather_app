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

  /// Retrieves the current location.
  ///
  /// If the current location has already been fetched and stored in the [state],
  /// it returns the stored location. Otherwise, it fetches the current location
  /// using the [_locationService] and updates the [state] with the fetched location.
  ///
  /// If an error occurs during the process, it updates the [state] with the error
  /// and rethrows the error.
  ///
  /// Returns the current location if successful, otherwise returns null.
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
