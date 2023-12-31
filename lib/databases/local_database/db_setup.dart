import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:weather_app/databases/local_database/models/db_weather_model.dart';

class DBSetup {
  static final DBSetup _dbSetup = DBSetup._internal();

  factory DBSetup() {
    return _dbSetup;
  }

  late final Isar isar;

  DBSetup._internal();

  Future<void> setup() async {
    final dir = await getApplicationDocumentsDirectory();
    try {
      isar = await Isar.open([DBWeatherModelSchema], directory: dir.path);
    } catch (e) {
      throw Exception("LocatDatabaseSetupError $e");
    }
  }
}
