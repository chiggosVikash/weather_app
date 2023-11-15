// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hourly_weather_forcast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HourlyWeatherForcastModel _$HourlyWeatherForcastModelFromJson(
        Map<String, dynamic> json) =>
    HourlyWeatherForcastModel(
      dt: json['dt'] as int,
      main: MainModel.fromJson(json['main'] as Map<String, dynamic>),
      weather: (json['weather'] as List<dynamic>)
          .map((e) => WeatherModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      wind: WindModel.fromJson(json['wind'] as Map<String, dynamic>),
      visibility: json['visibility'] as int,
      textDate: json['dt_txt'] as String,
    );

Map<String, dynamic> _$HourlyWeatherForcastModelToJson(
        HourlyWeatherForcastModel instance) =>
    <String, dynamic>{
      'dt': instance.dt,
      'main': instance.main,
      'weather': instance.weather,
      'wind': instance.wind,
      'visibility': instance.visibility,
      'dt_txt': instance.textDate,
    };
