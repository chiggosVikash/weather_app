import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/weather/domain/entities/hourly_weather_forcast_entity.dart';

import 'main_model.dart';
import 'weather_model.dart';
import 'wind_model.dart';

part 'hourly_weather_forcast_model.g.dart';

@JsonSerializable()
class HourlyWeatherForcastModel extends HourlyWeatherForcastEntity {
  const HourlyWeatherForcastModel(
      {required super.dt,
      required super.main,
      required super.weather,
      required super.wind,
      required super.visibility,
      required super.textDate});

  factory HourlyWeatherForcastModel.fromJson(Map<String, dynamic> json) =>
      _$HourlyWeatherForcastModelFromJson(json);

  Map<String, dynamic> toJson() => _$HourlyWeatherForcastModelToJson(this);

  factory HourlyWeatherForcastModel.fromEntity(
      HourlyWeatherForcastEntity entity) {
    return HourlyWeatherForcastModel(
      dt: entity.dt,
      main: entity.main,
      weather: entity.weather,
      wind: entity.wind,
      visibility: entity.visibility,
      textDate: entity.textDate,
    );
  }

  HourlyWeatherForcastEntity toEntity() {
    return HourlyWeatherForcastEntity(
      dt: dt,
      main: main,
      weather: weather,
      wind: wind,
      visibility: visibility,
      textDate: textDate,
    );
  }

  HourlyWeatherForcastModel copyWith({
    int? dt,
    MainModel? main,
    List<WeatherModel>? weather,
    WindModel? wind,
    int? visibility,
    String? textDate,
  }) {
    return HourlyWeatherForcastModel(
      dt: dt ?? this.dt,
      main: main ?? this.main,
      weather: weather ?? this.weather,
      wind: wind ?? this.wind,
      visibility: visibility ?? this.visibility,
      textDate: textDate ?? this.textDate,
    );
  }

  String onlyDate() {
    return textDate.substring(0, 10);
  }

  @override
  bool operator ==(covariant HourlyWeatherForcastModel other) {
    if (identical(this, other)) return true;

    return other.textDate.contains(textDate.substring(0, 10));
  }

  @override
  int get hashCode => textDate.hashCode;
}
