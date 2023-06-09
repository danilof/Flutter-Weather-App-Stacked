import 'package:weather_stacked/models/models.dart';

abstract class AppApi {
  Future<WeatherData> getWeatherData(
      double lat, double lon, String units, String appId);
}
