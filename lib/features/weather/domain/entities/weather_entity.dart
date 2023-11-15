import 'package:flutter/foundation.dart';

@immutable
class WeatherEntity {
  final int id;
  final String main;
  final String description;
  final String icon;

  const WeatherEntity({
    required this.id,
    required this.main,
    required this.description,
    required this.icon,
  });
}