import 'package:weather_app/utils/services/location_service/models/location_model.dart';

abstract class LocationService {
  Future<LocationModel> getCurrentLocation();
}
