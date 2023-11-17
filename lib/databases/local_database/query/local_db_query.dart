import 'package:weather_app/databases/local_database/models/db_weather_model.dart';

abstract class LocalDbQuery {
  Future<bool> addWeatherData(DBWeatherModel weatherData);

  Future<List<DBWeatherModel>> getAllWeatherData();

  Future<DBWeatherModel?> getWeatherDataByLocality(String locality);

  Future<bool> deleteWeatherDataByLocality(String locality);

  Future<bool> deleteAllWeatherData();

  // Future<bool> updateWeatherData(
  //     {required DBWeatherModel weatherData,
  //     required String queryCheckData,
  //     bool upsert = false});
}
