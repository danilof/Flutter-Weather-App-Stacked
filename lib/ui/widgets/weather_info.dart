import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_stacked/ui/common/app_strings.dart';
import 'package:weather_stacked/ui/common/shared_styles.dart';
import 'package:weather_stacked/ui/common/ui_helpers.dart';
import 'package:weather_stacked/ui/widgets/weather_info_viewmodel.dart';

class WeatherInfo extends StackedView<WeatherInfoViewModel> {
  const WeatherInfo({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    WeatherInfoViewModel viewModel,
    Widget? child,
  ) {
    return buildBody(viewModel);
  }

  Widget buildBody(WeatherInfoViewModel viewModel) {
    return viewModel.isBusy
        ? const Center(child: CircularProgressIndicator())
        : viewModel.weatherDataExists
            ? GestureDetector(
                onTap: viewModel.getWeatherData,
                child: Center(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      viewModel.weatherData!.name.toString(),
                      style: ktsTitle2,
                    ),
                    verticalSpaceMedium,
                    Text(
                      "${viewModel.weatherData!.main.temp.round().toString()} $ksCelsiusLabel",
                      style: ktsTitle,
                    ),
                    Text(
                      "$ksFeelsLikeLabel ${viewModel.weatherData!.main.feelsLike.ceil().toString()} $ksCelsiusLabel",
                      style: ktsTitle2,
                    ),
                    verticalSpaceLarge,
                    Text(
                      viewModel.weatherDescription,
                      style: ktsTitle2,
                    ),
                    verticalSpaceMedium,
                    Text(
                      "$ksWindLabel ${viewModel.weatherData!.wind.speed.toString()} $ksKmHLabel",
                      style: ktsTitle2,
                    ),
                  ],
                )),
              )
            : const SizedBox.shrink();
  }

  @override
  void onViewModelReady(WeatherInfoViewModel viewModel) {
    viewModel.getWeatherData();
    super.onViewModelReady(viewModel);
  }

  @override
  WeatherInfoViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      WeatherInfoViewModel();
}
