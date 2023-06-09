import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather_stacked/app/app.locator.dart';
import 'package:weather_stacked/app/app.logger.dart';
import 'package:weather_stacked/models/models.dart';
import 'package:weather_stacked/services/weather_service.dart';
import 'package:weather_stacked/ui/common/app_strings.dart';

class WeatherInfoViewModel extends BaseViewModel {
  final log = getLogger("WeatherInfoViewModel");
  final _weatherService = locator<WeatherService>();
  final _sheetService = locator<BottomSheetService>();

  bool get weatherDataExists => _weatherService.hasData;
  WeatherData? get weatherData => _weatherService.weatherData;

  List<ListenableServiceMixin> get listenableServices => [_weatherService];

  String get weatherDescription {
    if (weatherDataExists &&
        weatherData!.weather != null &&
        weatherData!.weather!.isNotEmpty) {
      return "${weatherData!.weather![0].main} (${weatherData!.weather![0].description})";
    }
    return "/";
  }

  Future<void>? getWeatherData() async {
    try {
      setBusy(true);
      await _weatherService.getWeatherInfoForCurrentLocation();
      log.i("get weather data success");
      setBusy(false);
    } catch (e) {
      setBusy(false);
      log.e(e);
      _sheetService
          .showBottomSheet(
              title: ksErrorDialogTitle,
              barrierDismissible: false,
              description: e.toString(),
              confirmButtonTitle: ksErrorDialogTryAgainLabel)
          .then((value) => getWeatherData());
    }
  }
}
