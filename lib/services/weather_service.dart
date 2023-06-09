import 'package:stacked/stacked.dart';
import 'package:weather_stacked/app/app.locator.dart';
import 'package:weather_stacked/app/app.logger.dart';
import 'package:weather_stacked/models/models.dart';
import 'package:weather_stacked/services/repository_service.dart';

class WeatherService with ListenableServiceMixin {
  final _log = getLogger("WeatherService");
  final _repositoryService = locator<RepositoryService>();
  WeatherData get weatherData => _weatherData!;
  bool get hasData => _weatherData != null;
  WeatherData? _weatherData;

  Future<void> getWeatherInfoForCurrentLocation() async {
    try {
      _weatherData =
          await _repositoryService.getWeatherInfoForCurrentLocation();
      notifyListeners();
      _log.i("success: getting weather data");
    } catch (e) {
      _log.e(e);
      rethrow;
    }
  }
}
