import 'package:weather_app/features/weather/data/models/current_weather_forcast_model.dart';

abstract class WeatherForcastDataSource {
  Future<CurrentWeatherForcastModel> getCurrentWeatherForcast(
      {required double lat, required double lon});
}
