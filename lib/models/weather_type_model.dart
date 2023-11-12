import 'package:weather_app/utils/enums/weathertype_enums.dart';

class WeatherTypeDModel {
  String icon;
  String weatherType;
  String location;
  WeatherType weatherTypeEnum;
  WeatherTypeDModel(
      {required this.icon,
      required this.weatherType,
      required this.location,
      required this.weatherTypeEnum});
}
