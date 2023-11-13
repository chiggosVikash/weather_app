import 'package:weather_app/features/weather/data/data_source/weather_forcast_datasource_impl.dart';
import 'package:weather_app/features/weather/data/models/current_weather_forcast_model.dart';
import 'package:weather_app/features/weather/data/repos/weather_forcast_repo_impl.dart';

import '../repos/weather_forcast_repo.dart';

class WeatherFocastUseCase {
  final WeatherForcastRepo _weatherForcastRepo =
      WeatherForcastRepoImpl(WeatherForcastDataSourceImpl());

  Future<CurrentWeatherForcastModel> getCurrentWeatherForcast(
      {required double lat, required double lon}) async {
    return await _weatherForcastRepo.getCurrentWeatherForcast(
        lat: lat, lon: lon);
  }

  Future<void> getAddressFromLatLong(
      {required double lat, required double lon}) async {}
}
