import 'package:weather_stacked/enums/environment.dart';

/// Loads all the required environment values
class EnvironmentService {
  static const String kEnvDevelopment = 'Development';
  static const String kEnvProduction = 'Production';
  static const String kEnvStaging = 'Staging';

  static const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: kEnvDevelopment,
  );
  static const String baseUrl = String.fromEnvironment('BASE_URL',
      defaultValue: "https://api.openweathermap.org/data/2.5/");
  static const String apiKey = String.fromEnvironment('API_KEY',
      defaultValue: "f680767b4b2caf35f5d2024a1f07e28e");

  static bool get isDevelopment =>
      currentEnvironment == Environment.development;
  static bool get isProduction => currentEnvironment == Environment.production;
  static bool get isStaging => currentEnvironment == Environment.staging;

  static Environment get currentEnvironment {
    switch (environment) {
      case kEnvDevelopment:
        return Environment.development;
      case kEnvProduction:
        return Environment.production;
      case kEnvStaging:
        return Environment.staging;
      default:
        return Environment.development;
    }
  }
}
