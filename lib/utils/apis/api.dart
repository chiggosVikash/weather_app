class Api {
  Api._();

  static const _apiKey = "a6dc288dd9cb0347a64c3fe3140264eb";

  static const _baseUrl = "https://api.openweathermap.org/data/2.5/weather";

  static String currentWeatherApi(double lat, double long) {
    return "$_baseUrl?lat=$lat&lon=$long&appid=$_apiKey";
  }
}
