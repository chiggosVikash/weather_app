import 'package:weather_app/features/weather/data/data_source/weather_forcast_datasource_impl.dart';
import 'package:weather_app/features/weather/data/models/current_weather_forcast_model.dart';
import 'package:weather_app/features/weather/data/models/hourly_weather_forcast_model.dart';
import 'package:weather_app/features/weather/data/repos/weather_forcast_repo_impl.dart';
import 'package:weather_app/utils/extensions/date_extension.dart';

import '../repos/weather_forcast_repo.dart';

class WeatherFocastUseCase {
  final WeatherForcastRepo _weatherForcastRepo =
      WeatherForcastRepoImpl(WeatherForcastDataSourceImpl());

  /// Returns the current weather forecast for the given latitude and longitude.
  ///
  /// Throws a [WeatherForcastException] if there was an error getting the forecast.
  ///
  /// The [lat] and [lon] parameters are required and must be of type [double].
  ///
  Future<CurrentWeatherForcastModel> getCurrentWeatherForcast(
      {required double lat, required double lon}) async {
    return await _weatherForcastRepo.getCurrentWeatherForcast(
        lat: lat, lon: lon);
  }

  /// Returns a list of [HourlyWeatherForcastModel] for the next 5 days based on the given latitude and longitude.
  ///
  /// Throws a [Exception] if unable to get the weather forecast.
  Future<List<HourlyWeatherForcastModel>> get5DayWeatherForcast(
      {required double lat, required double lon}) async {
    return await _weatherForcastRepo.get5DatWeatherForcast(lat: lat, lon: lon);
  }

  Future<void> getAddressFromLatLong(
      {required double lat, required double lon}) async {}

  /// Returns a list of [HourlyWeatherForcastModel] containing the weather forecast for today.
  ///
  /// The [forcasts] parameter is a list of [HourlyWeatherForcastModel] containing the weather forecast for multiple days.
  /// The function filters the list to only include the forecast for today's date.
  List<HourlyWeatherForcastModel> getTodayWeatherForcast(
      List<HourlyWeatherForcastModel> forcasts) {
    final today = DateTime.now().onlyDate;

    final todayWeathers =
        forcasts.where((element) => element.textDate.contains(today)).toList();
    return todayWeathers;
  }

  /// Returns a list of [HourlyWeatherForcastModel] objects grouped by day with average temperature for each day.
  ///
  /// The function takes a list of [HourlyWeatherForcastModel] objects as input and returns a new list of [HourlyWeatherForcastModel]
  /// objects with the same data as the input list but where each day is represented by a single object with the average temperature
  /// of that day. The function calculates the average temperature for each day by iterating through the input list and summing up
  /// the temperatures of all hourly forecasts for that day and then dividing by the number of hourly forecasts for that day.
  ///
  List<HourlyWeatherForcastModel> getDaysWiseForcastReport(
      List<HourlyWeatherForcastModel> forcasts) {
    final List<HourlyWeatherForcastModel> daysWiseForcast = [];

    for (var i = 0; i < forcasts.length; i++) {
      // final onlyDate = forcasts[i].textDate.substring(0, 10);
      if (daysWiseForcast.contains(forcasts[i]) == false) {
        final avgTemp = _calculateAverageTemp(forcasts, forcasts[i].textDate);

        final newForcast = forcasts[i]
            .copyWith(main: forcasts[i].main.copyWith(temp: avgTemp));
        daysWiseForcast.add(newForcast);
      }

      // final current = forcasts[i];
      // if (current.textDate != next.textDate) {
      //   daysWiseForcast.add(current);
      // }
    }

    return daysWiseForcast;
  }

  /// Calculates the average temperature for a given date from a list of hourly weather forecasts.
  ///
  /// The function takes a list of [HourlyWeatherForcastModel] and a [date] string in the format "yyyy-mm-dd hh:mm:ss".
  /// It extracts the date from the string and calculates the average temperature for that date from the list of forecasts.
  /// Returns the average temperature as a double.
  double _calculateAverageTemp(
      List<HourlyWeatherForcastModel> forcasts, String date) {
    final onlyDate = date.substring(0, 10);
    int totalWeatherCount = 0;
    double totalTemp = 0.0;
    for (var weather in forcasts) {
      if (weather.onlyDate() == onlyDate) {
        totalWeatherCount++;
        totalTemp += weather.main.inCelcious;
      }
    }

    return totalTemp / totalWeatherCount;
  }
}
