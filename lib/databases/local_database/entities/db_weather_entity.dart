import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';

@immutable
class DbWeatherEntity {
  final double latitude;
  final double longitude;
  @Index(unique: true)
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
