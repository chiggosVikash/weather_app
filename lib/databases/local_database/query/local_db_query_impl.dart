import 'package:isar/isar.dart';
import 'package:weather_app/databases/local_database/models/db_weather_model.dart';
import 'package:weather_app/databases/local_database/query/local_db_query.dart';

import '../db_setup.dart';

class LocalDbQueryImpl extends LocalDbQuery {
  final Isar _isar = DBSetup().isar;
  @override
  Future<bool> addWeatherData(DBWeatherModel weatherData) async {
    try {
      await _isar.writeTxn(() async {
        final query = _isar.dBWeatherModels
            .filter()
            .latitudeEqualTo(weatherData.latitude)
            .longitudeEqualTo(weatherData.longitude)
            .or()
            .localityEqualTo(weatherData.locality, caseSensitive: false)
            .build();
        final matched = await query.findAll();
        if (matched.isNotEmpty) {
          print("Delete executed with total data ${matched.length}}");
          await query.deleteAll();
        }
        final status = await _isar.dBWeatherModels.put(weatherData);
        return status;
      });
      return true;
    } catch (e) {
      throw Exception("LocalDbQueryError $e");
    }
  }

  @override
  Future<bool> deleteAllWeatherData() async {
    try {
      await _isar.writeTxn(() async {
        await _isar.dBWeatherModels.buildQuery().deleteAll();
        return true;
      });
      return true;
    } catch (e) {
      throw Exception("LocalDbQueryError $e");
    }
  }

  @override
  Future<bool> deleteWeatherDataByLocality(String locality) async {
    try {
      await _isar.writeTxn(() async {
        final query = _isar.dBWeatherModels
            .filter()
            .localityEqualTo(locality, caseSensitive: false)
            .build();
        query.deleteAll();
      });
      return true;
    } catch (e) {
      throw Exception("LocalDbQueryError $e");
    }
  }

  @override
  Future<List<DBWeatherModel>> getAllWeatherData() async {
    try {
      final weathers = await _isar.writeTxn(() async {
        final Query<DBWeatherModel> query = _isar.dBWeatherModels.buildQuery();
        final matched = await query.findAll();
        return matched;
      });
      return weathers;
    } catch (e) {
      throw Exception("LocalDbQueryError $e");
    }
  }

  @override
  Future<DBWeatherModel?> getWeatherDataByLocality(String locality) async {
    try {
      final weather = await _isar.writeTxn(() async {
        final query = _isar.dBWeatherModels
            .filter()
            .localityEqualTo(locality, caseSensitive: false)
            .build();
        final matched = await query.findFirst();
        return matched;
      });
      return weather;
    } catch (e) {
      throw Exception("LocalDbQueryError $e");
    }
  }

  // @override
  // Future<bool> updateWeatherData(
  //     {required DBWeatherModel weatherData,
  //     required String queryCheckData,
  //     bool upsert = false}) {
  // }
}
