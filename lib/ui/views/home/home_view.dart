import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:weather_stacked/ui/common/app_strings.dart';
import 'package:weather_stacked/ui/widgets/weather_info.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    HomeViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text(ksHomeAppBarTitle)),
      body: const SafeArea(
        child: WeatherInfo(),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      HomeViewModel();
}
