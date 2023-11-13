import 'package:weather_app/features/weather/data/data_source/weather_forcast_datasource.dart';
import 'package:weather_app/features/weather/data/models/current_weather_forcast_model.dart';
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
}
