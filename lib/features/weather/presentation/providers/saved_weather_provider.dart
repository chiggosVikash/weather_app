import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/databases/local_database/models/db_weather_model.dart';
import 'package:weather_app/features/weather/domain/use_cases/weather_forcast_usecase.dart';

final savedWeatherProvider =
    AsyncNotifierProvider.autoDispose<SavedWeatherP, List<DBWeatherModel>>(
  () => SavedWeatherP(),
);

class SavedWeatherP extends AutoDisposeAsyncNotifier<List<DBWeatherModel>> {
  final WeatherFocastUseCase _weatherFocastUseCase = WeatherFocastUseCase();

  @override
  FutureOr<List<DBWeatherModel>> build() {
    return _weatherFocastUseCase.getAllWeatherData();
  }
}
