import 'package:freezed_annotation/freezed_annotation.dart';

part 'models.freezed.dart';
part 'models.g.dart';

@freezed
class WeatherData with _$WeatherData, SerializeJson {
  WeatherData._();

  factory WeatherData(
      {required Main main,
      List<Weather>? weather,
      required Wind wind,
      required String name}) = _WeatherData;

  factory WeatherData.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataFromJson(json);
}

@freezed
class Main with _$Main, SerializeJson {
  Main._();

  factory Main(
      {required double temp,
      @JsonKey(name: "feels_like") required double feelsLike}) = _Main;

  factory Main.fromJson(Map<String, dynamic> json) => _$MainFromJson(json);
}

@freezed
class Weather with _$Weather, SerializeJson {
  Weather._();

  factory Weather({required String main, required String description}) =
      _Weather;

  factory Weather.fromJson(Map<String, dynamic> json) =>
      _$WeatherFromJson(json);
}

@freezed
class Wind with _$Wind, SerializeJson {
  Wind._();

  factory Wind({required double speed, required int deg}) = _Wind;

  factory Wind.fromJson(Map<String, dynamic> json) => _$WindFromJson(json);
}

@freezed
class PositionData with _$PositionData, SerializeJson {
  PositionData._();

  factory PositionData({required double latitude, required double longitude}) =
      _PositionData;

  factory PositionData.fromJson(Map<String, dynamic> json) =>
      _$PositionDataFromJson(json);
}

mixin SerializeJson {
  Map<String, dynamic> toJson();
}
