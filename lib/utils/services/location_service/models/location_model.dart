import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/utils/services/location_service/entities/location_entity.dart';
part 'location_model.g.dart';

@JsonSerializable()
class LocationModel extends LocationEntity {
  const LocationModel(
      {required super.latitude,
      required super.longitude,
      super.country,
      super.countryCode,
      super.locality,
      super.postalCode,
      super.state,
      super.street});

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  LocationModel copyWith({
    double? latitude,
    double? longitude,
    String? locality,
    String? street,
    String? countryCode,
    String? country,
    String? state,
    String? postalCode,
  }) {
    return LocationModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      locality: locality ?? this.locality,
      street: street ?? this.street,
      countryCode: countryCode ?? this.countryCode,
      country: country ?? this.country,
      postalCode: postalCode ?? this.postalCode,
      state: state ?? this.state,
    );
  }
}
