import 'package:weather_app/databases/local_database/models/db_weather_model.dart';
import 'package:weather_app/features/weather/data/models/current_weather_forcast_model.dart';
import 'package:weather_app/features/weather/data/models/hourly_weather_forcast_model.dart';

abstract class WeatherForcastDataSource {
  Future<CurrentWeatherForcastModel> getCurrentWeatherForcast(
      {required double lat, required double lon});

  Future<List<HourlyWeatherForcastModel>> get5DayWeatherForcast(
      {required double lat, required double lon});

  Future<void> saveWheatherInLocalDB(DBWeatherModel currentWeather);

  Future<List<DBWeatherModel>> getAllWeatherData();
}
