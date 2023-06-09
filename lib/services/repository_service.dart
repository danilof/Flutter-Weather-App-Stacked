import 'package:weather_stacked/app/app.locator.dart';
import 'package:weather_stacked/app/app.logger.dart';
import 'package:weather_stacked/models/models.dart';
import 'package:weather_stacked/services/api/weather_api_service.dart';
import 'package:weather_stacked/services/current_location_service.dart';
import 'package:weather_stacked/services/environment_service.dart';

class RepositoryService {
  final _log = getLogger("RepositoryService");
  final _currentLocationService = locator<CurrentLocationService>();
  final _apiService = locator<ApiService>();

  Future<WeatherData?> getWeatherInfoForCurrentLocation() async {
    try {
      _log.i("try to get position");
      final positionData = await _currentLocationService.getCurrentPosition();
      _log.i("try to get weather data");
      final weatherData = await _apiService.getWeatherData(
          positionData.latitude,
          positionData.longitude,
          "metric",
          EnvironmentService.apiKey);
      _log.i("success: getting weather data");
      return weatherData;
    } catch (e) {
      _log.e(e);
      rethrow;
    }
  }
}
