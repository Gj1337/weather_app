import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/src/di/providers.dart';
import 'package:weather_app/src/presentation/screens/main_screen/widgets/pick_first_location_widget.dart';
import 'package:weather_app/src/presentation/screens/main_screen/widgets/weather_forecast_widget/weather_forecast_widget.dart';

class NarrowMainScreen extends ConsumerWidget {
  const NarrowMainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainScreenStateNotifierProvider);

    return Center(
      child: state.location != null
          ? const WeatherForecastWidget()
          : const PickFirstLocationWidget(),
    );
  }
}
