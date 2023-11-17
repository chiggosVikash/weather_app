import 'package:weather_app/databases/local_database/models/db_weather_model.dart';
import 'package:weather_app/features/weather/data/data_source/weather_forcast_datasource.dart';
import 'package:weather_app/features/weather/data/models/current_weather_forcast_model.dart';
import 'package:weather_app/features/weather/data/models/hourly_weather_forcast_model.dart';
import 'package:weather_app/features/weather/domain/repos/weather_forcast_repo.dart';

class WeatherForcastRepoImpl implements WeatherForcastRepo {
  final WeatherForcastDataSource _weatherForcastDataSource;
  WeatherForcastRepoImpl(this._weatherForcastDataSource);
  @override
  Future<CurrentWeatherForcastModel> getCurrentWeatherForcast(
      {required double lat, required double lon}) {
    return _weatherForcastDataSource.getCurrentWeatherForcast(
        lat: lat, lon: lon);
  }

  @override
  Future<List<HourlyWeatherForcastModel>> get5DatWeatherForcast(
      {required double lat, required double lon}) {
    return _weatherForcastDataSource.get5DayWeatherForcast(lat: lat, lon: lon);
  }

  @override
  Future<void> saveWheatherInLocalDB(DBWeatherModel currentWeatherModel) async {
    await _weatherForcastDataSource.saveWheatherInLocalDB(currentWeatherModel);
  }

  @override
  Future<List<DBWeatherModel>> getAllWeatherData() {
    return _weatherForcastDataSource.getAllWeatherData();
  }
}
