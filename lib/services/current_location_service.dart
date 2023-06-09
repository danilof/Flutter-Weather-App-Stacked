import 'package:geolocator/geolocator.dart';
import 'package:weather_stacked/app/app.logger.dart';
import 'package:weather_stacked/app/error/exception.dart';
import 'package:weather_stacked/models/models.dart';

class CurrentLocationService {
  final _log = getLogger("CurrentLocationService");
  final GeolocatorPlatform _locationService = GeolocatorPlatform.instance;

  Future<PositionData> getCurrentPosition() async {
    try {
      if (!await _hasPermission) {
        throw LocationPermissionException("No location permission");
      }
      Position position = await _locationService.getCurrentPosition(
        locationSettings:
            const LocationSettings(accuracy: LocationAccuracy.high),
      );
      _log.i(
          "We have location: lat:${position.latitude} long:${position.longitude}");
      return PositionData(
          latitude: position.latitude, longitude: position.longitude);
    } catch (e) {
      _log.e(e.toString());
      throw LocationException(e.toString());
    }
  }

  Future<bool> get _hasPermission async {
    LocationPermission? permission;
    _log.i("LocationPermission check permissions");
    permission = await _locationService.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _locationService.requestPermission();
      if (permission == LocationPermission.denied) {
        _log.d("LocationPermission.denied");
        return false;
      }
      if (permission == LocationPermission.deniedForever) {
        _log.d("LocationPermission.deniedForever");
        return false;
      }
    }
    _log.i("LocationPermission is granted");
    return true;
  }
}
