import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/weather/domain/entities/current_weather_forcast_entity.dart';

import '../../../../utils/services/location_service/models/location_model.dart';
import 'main_model.dart';
import 'weather_model.dart';
import 'wind_model.dart';
part 'current_weather_forcast_model.g.dart';

@JsonSerializable()
class CurrentWeatherForcastModel extends CurrentWeatherForcastEntity {
  const CurrentWeatherForcastModel(
      {required super.coord,
      required super.wind,
      required super.main,
      required super.weathers,
      required super.base});

  factory CurrentWeatherForcastModel.fromJson(Map<String, dynamic> json) =>
      _$CurrentWeatherForcastModelFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentWeatherForcastModelToJson(this);

  CurrentWeatherForcastModel copyWith({
    LocationModel? coord,
    WindModel? wind,
    MainModel? main,
    List<WeatherModel>? weathers,
    String? base,
  }) {
    return CurrentWeatherForcastModel(
      coord: coord ?? this.coord,
      wind: wind ?? this.wind,
      main: main ?? this.main,
      weathers: weathers ?? this.weathers,
      base: base ?? this.base,
    );
  }
}
