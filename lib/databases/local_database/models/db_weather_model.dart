import 'package:isar/isar.dart';
import 'package:weather_app/databases/local_database/entities/db_weather_entity.dart';
part 'db_weather_model.g.dart';

@Collection()
class DBWeatherModel extends DbWeatherEntity {
  final Id id = Isar.autoIncrement;
  const DBWeatherModel(
      {required super.latitude,
      required super.longitude,
      super.locality,
      super.weatherCondition,
      super.temperature,
      super.humidity,
      super.windSpeed,
      super.icon});

  DBWeatherModel copyWith({
    double? latitude,
    double? longitude,
    String? locality,
    String? weatherCondition,
    double? temperature,
    int? humidity,
    double? windSpeed,
    String? icon,
  }) {
    return DBWeatherModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      locality: locality ?? this.locality,
      weatherCondition: weatherCondition ?? this.weatherCondition,
      temperature: temperature ?? this.temperature,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
      icon: icon ?? this.icon,
    );
  }
}
