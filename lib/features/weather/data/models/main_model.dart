import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/weather/domain/entities/main_entity.dart';
part 'main_model.g.dart';

@JsonSerializable()
class MainModel extends MainEntity {
  const MainModel(
      {required super.feelsLike,
      required super.temp,
      required super.tempMin,
      required super.tempMax,
      required super.pressure,
      required super.humidity,
      required super.seaLevel,
      required super.grndLevel});

  factory MainModel.fromJson(Map<String, dynamic> json) =>
      _$MainModelFromJson(json);

  Map<String, dynamic> toJson() => _$MainModelToJson(this);

  /// Converts Kelvin to Celcious
  double get inCelcious => temp - 273.15;
}
