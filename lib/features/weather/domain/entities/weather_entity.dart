import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
class WeatherEntity {
  @JsonKey(name: "id")
  final int weatherId;
  final String main;
  final String description;
  final String icon;

  const WeatherEntity({
    required this.weatherId,
    required this.main,
    required this.description,
    required this.icon,
  });
}
