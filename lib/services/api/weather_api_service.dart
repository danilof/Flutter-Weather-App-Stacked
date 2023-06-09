import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_stacked/models/models.dart';
import 'package:weather_stacked/services/api/app_api.dart';
import 'package:weather_stacked/services/api/dio_interceptor.dart';
import 'package:weather_stacked/services/environment_service.dart';

part 'weather_api_service.g.dart';

@RestApi()
abstract class ApiService implements AppApi {
  factory ApiService() {
    Dio dio = Dio();
    dio.options.followRedirects = false;
    dio.interceptors.add(DioInterceptor(dio));

    return _ApiService(dio, baseUrl: EnvironmentService.baseUrl);
  }

  @override
  @GET("weather/")
  Future<WeatherData> getWeatherData(
      @Query("lat") double lat,
      @Query("lon") double lon,
      @Query("units") String units,
      @Query("appid") String appId);
}
