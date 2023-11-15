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

  MainModel copyWith({
    double? feelsLike,
    double? temp,
    double? tempMin,
    double? tempMax,
    int? pressure,
    int? humidity,
    int? seaLevel,
    int? grndLevel,
  }) {
    return MainModel(
      feelsLike: feelsLike ?? this.feelsLike,
      temp: temp ?? this.temp,
      tempMin: tempMin ?? this.tempMin,
      tempMax: tempMax ?? this.tempMax,
      pressure: pressure ?? this.pressure,
      humidity: humidity ?? this.humidity,
      seaLevel: seaLevel ?? this.seaLevel,
      grndLevel: grndLevel ?? this.grndLevel,
    );
  }
}
