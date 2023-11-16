class WeatherIconUsecase {
  WeatherIconUsecase._();

  static String getIcon(String icon) {
    switch (icon) {
      /// clear sky in day
      case '01d':
        return 'assets/sunny.png';

      /// clear sky in night
      case '01n':
        return 'assets/sunny.png';

      /// few clouds in day
      case '02d':
        return 'assets/mostly_cloudy.png';

      /// few clouds in night
      case '02n':
        return 'assets/mostly_cloudy.png';

      /// scattered clouds in day
      case '03d':
        return 'assets/mostly_cloudy.png';

      /// scattered clouds in night
      case '03n':
        return 'assets/mostly_cloudy.png';

      /// broken clouds in day
      case '04d':
        return 'assets/mostly_cloudy.png';

      /// broken clouds in night
      case '04n':
        return 'assets/mostly_cloudy.png';

      /// shower rain in day
      case '09d':
        return 'assets/rainy.png';

      /// shower rain in night
      case '09n':
        return 'assets/rainy.png';

      /// rain in day
      case '10d':
        return 'assets/rainy.png';

      /// rain in night
      case '10n':
        return 'assets/rainy.png';

      /// thunderstorm in day
      case '11d':
        return 'assets/thunderstorm.png';

      /// thunderstorm in night
      case '11n':
        return 'assets/thunderstorm.png';

      /// snow in day
      case '13d':
        return 'assets/show.png';

      /// snow in night
      case '13n':
        return 'assets/show.png';

      /// mist in day
      case '50d':
        return 'assets/mist.png';

      /// mist in night
      case '50n':
        return 'assets/mist.png';
      default:
        return 'assets/sunny.png';
    }
  }
}
