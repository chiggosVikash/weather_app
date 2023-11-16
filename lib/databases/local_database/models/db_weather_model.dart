import 'package:isar/isar.dart';
import 'package:weather_app/databases/local_database/entities/db_weather_entity.dart';

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
      super.windSpeed});
}
