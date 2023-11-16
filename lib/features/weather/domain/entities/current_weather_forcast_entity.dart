import 'package:flutter/foundation.dart';
import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/weather/data/models/main_model.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/data/models/wind_model.dart';
import 'package:weather_app/utils/services/location_service/models/location_model.dart';

@immutable
class CurrentWeatherForcastEntity {
  @ignore
  final LocationModel coord;

  @JsonKey(name: "weather")
  @ignore
  final List<WeatherModel> weathers;

  final String base;

  @ignore
  final MainModel main;

  @ignore
  final WindModel wind;
  const CurrentWeatherForcastEntity(
      {required this.coord,
      required this.wind,
      required this.main,
      required this.weathers,
      required this.base});
}
