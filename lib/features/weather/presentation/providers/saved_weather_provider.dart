import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:weather_app/databases/local_database/models/db_weather_model.dart';
import 'package:weather_app/features/weather/domain/use_cases/weather_forcast_usecase.dart';

/// A provider for retrieving saved weather data from the database.
///
/// This provider is responsible for managing the state of saved weather data
/// and provides methods for retrieving and updating the data.
final getSavedWeatherProvider =
    AsyncNotifierProvider.autoDispose<SavedWeatherP, List<DBWeatherModel>>(
  () => SavedWeatherP(),
);

/// A provider class for managing saved weather data.
/// Extends [AutoDisposeAsyncNotifier] to automatically dispose of resources when no longer needed.
class SavedWeatherP extends AutoDisposeAsyncNotifier<List<DBWeatherModel>> {
  final WeatherFocastUseCase _weatherFocastUseCase = WeatherFocastUseCase();

  @override
  FutureOr<List<DBWeatherModel>> build() {
    return _weatherFocastUseCase.getAllWeatherData();
  }
}
