import 'package:weather_app/features/weather/data/models/current_weather_forcast_model.dart';
import 'package:weather_app/features/weather/data/models/hourly_weather_forcast_model.dart';

abstract class WeatherForcastRepo {
  Future<CurrentWeatherForcastModel> getCurrentWeatherForcast(
      {required double lat, required double lon});

  Future<List<HourlyWeatherForcastModel>> get5DatWeatherForcast(
      {required double lat, required double lon});
}
