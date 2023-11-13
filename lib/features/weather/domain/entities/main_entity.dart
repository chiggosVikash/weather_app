import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

@immutable
class MainEntity {
  final double temp;
  @JsonKey(name: "feels_like")
  final double feelsLike;
  @JsonKey(name: "temp_min")
  final double tempMin;
  @JsonKey(name: "temp_max")
  final double tempMax;
  final int pressure;
  final int humidity;
  @JsonKey(name: "sea_level")
  final int? seaLevel;
  @JsonKey(name: "grnd_level")
  final int? grndLevel;

  const MainEntity(
      {required this.feelsLike,
      required this.temp,
      required this.tempMin,
      required this.tempMax,
      required this.pressure,
      required this.humidity,
      required this.seaLevel,
      required this.grndLevel});
}
