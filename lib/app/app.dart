import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:weather_stacked/services/api/weather_api_service.dart';
import 'package:weather_stacked/services/current_location_service.dart';
import 'package:weather_stacked/services/weather_service.dart';
import 'package:weather_stacked/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:weather_stacked/ui/views/home/home_view.dart';
import 'package:weather_stacked/services/repository_service.dart';
// @stacked-import

@StackedApp(routes: [
  MaterialRoute(page: HomeView, initial: true),
  // @stacked-route
], dependencies: [
  LazySingleton(classType: BottomSheetService),
  LazySingleton(classType: DialogService),
  LazySingleton(classType: NavigationService),
  LazySingleton(classType: CurrentLocationService),
  LazySingleton(classType: WeatherService),
  LazySingleton(classType: ApiService),
  LazySingleton(classType: RepositoryService),
// @stacked-service
], bottomsheets: [
  StackedBottomsheet(classType: NoticeSheet),
  // @stacked-bottom-sheet
], logger: StackedLogger())
class App {}
