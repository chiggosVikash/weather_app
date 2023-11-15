import 'dart:convert';

import 'package:weather_app/features/weather/data/data_source/weather_forcast_datasource.dart';
import 'package:weather_app/features/weather/data/models/current_weather_forcast_model.dart';
import 'package:weather_app/features/weather/data/models/hourly_weather_forcast_model.dart';
import 'package:weather_app/utils/apis/api.dart';
import 'package:http/http.dart' as http show get;

class WeatherForcastDataSourceImpl implements WeatherForcastDataSource {
  @override
  Future<CurrentWeatherForcastModel> getCurrentWeatherForcast(
      {required double lat, required double lon}) async {
    final api = Api.currentWeatherApi(lat, lon);
    try {
      final response = await http.get(Uri.parse(api));
      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = await jsonDecode(response.body);
        return CurrentWeatherForcastModel.fromJson(jsonData);
      } else {
        throw Exception("Failed to load weather forcast");
      }
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<HourlyWeatherForcastModel>> get5DayWeatherForcast(
      {required double lat, required double lon}) async {
    final api = Api.hourlyWeatherApi(lat, lon);
    try {
      final response = await http.get(Uri.parse(api));

      if (response.statusCode == 200) {
        final Map<String, dynamic> jsonData = await jsonDecode(response.body);

        final List<dynamic> weatherDatas = jsonData["list"];
        final hourlyWeathers = weatherDatas
            .map((e) => HourlyWeatherForcastModel.fromJson(e))
            .toList();
        return hourlyWeathers;
      } else {
        throw Exception("Failed to load weather forcast");
      }
    } catch (e) {
      rethrow;
    }
  }
}
