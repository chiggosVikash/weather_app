import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/weather/data/models/main_model.dart';
import 'package:weather_app/features/weather/data/models/weather_model.dart';
import 'package:weather_app/features/weather/data/models/wind_model.dart';

@immutable
class HourlyWeatherForcastEntity {
  final int dt;
  final MainModel main;
  final List<WeatherModel> weather;
  final WindModel wind;
  final int visibility;
  @JsonKey(name: 'dt_txt')
  final String textDate;

  const HourlyWeatherForcastEntity(
      {required this.dt,
      required this.main,
      required this.weather,
      required this.wind,
      required this.visibility,
      required this.textDate});
}
