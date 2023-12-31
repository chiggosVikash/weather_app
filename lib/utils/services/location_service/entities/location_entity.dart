import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/weather/data/models/current_weather_forcast_model.dart';

@immutable
class LocationEntity {
  @JsonKey(name: "lat")
  final double latitude;
  @JsonKey(name: "lon")
  final double longitude;
  @JsonKey(includeFromJson: false, includeToJson: true)
  final String? locality;
  @JsonKey(includeFromJson: false, includeToJson: true)
  final String? street;
  @JsonKey(includeFromJson: false, includeToJson: true)
  final String? countryCode;
  @JsonKey(includeFromJson: false, includeToJson: true)
  final String? country;
  @JsonKey(includeFromJson: false, includeToJson: true)
  final String? postalCode;
  @JsonKey(includeFromJson: false, includeToJson: true)
  final String? state;
  @JsonKey(includeFromJson: false, includeToJson: false)
  final String? subLocality;

  @JsonKey(includeFromJson: false, includeToJson: false)
  final currentLocationLink = IsarLink<CurrentWeatherForcastModel>();

  LocationEntity(
      {required this.latitude,
      required this.longitude,
      this.locality,
      this.state,
      this.country,
      this.countryCode,
      this.postalCode,
      this.subLocality,
      this.street});
}
