import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/weather/domain/entities/weather_entity.dart';
part 'weather_model.g.dart';

@JsonSerializable()
class WeatherModel extends WeatherEntity {
  const WeatherModel(
      {required super.id,
      required super.main,
      required super.description,
      required super.icon});

  factory WeatherModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherModelFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherModelToJson(this);
}
