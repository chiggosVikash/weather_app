import 'package:flutter/foundation.dart';

@immutable
class DbWeatherEntity {
  final double latitude;
  final double longitude;
  final String? locality;
  final String? weatherCondition;
  final double? temperature;
  final int? humidity;
  final double? windSpeed;
  final String? icon;

  const DbWeatherEntity(
      {required this.latitude,
      required this.longitude,
      this.locality,
      this.weatherCondition,
      this.temperature,
      this.humidity,
      this.windSpeed,
      this.icon});
}
