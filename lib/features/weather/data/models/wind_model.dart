import 'package:json_annotation/json_annotation.dart';
import 'package:weather_app/features/weather/domain/entities/wind_entity.dart';
part 'wind_model.g.dart';

@JsonSerializable()
class WindModel extends WindEntity {
  const WindModel(
      {required super.deg, required super.gust, required super.speed});

  factory WindModel.fromJson(Map<String, dynamic> json) =>
      _$WindModelFromJson(json);
  Map<String, dynamic> toJson() => _$WindModelToJson(this);
}
