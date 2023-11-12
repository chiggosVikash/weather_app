import 'package:weather_app/features/permission_handler/domain/entities/location_entity.dart';

// @JsonSerializable()
class LocationModel extends LocationEntity {
  const LocationModel({required super.latitude, required super.longitude});

  LocationModel copyWith({
    double? latitude,
    double? longitude,
  }) {
    return LocationModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
    );
  }
}
