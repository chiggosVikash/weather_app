// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_weather_forcast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrentWeatherForcastModel _$CurrentWeatherForcastModelFromJson(
        Map<String, dynamic> json) =>
    CurrentWeatherForcastModel(
      coord: LocationModel.fromJson(json['coord'] as Map<String, dynamic>),
      wind: WindModel.fromJson(json['wind'] as Map<String, dynamic>),
      main: MainModel.fromJson(json['main'] as Map<String, dynamic>),
      weathers: (json['weather'] as List<dynamic>)
          .map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      base: json['base'] as String,
    );

Map<String, dynamic> _$CurrentWeatherForcastModelToJson(
        CurrentWeatherForcastModel instance) =>
    <String, dynamic>{
      'coord': instance.coord,
      'weather': instance.weathers,
      'base': instance.base,
      'main': instance.main,
      'wind': instance.wind,
    };
