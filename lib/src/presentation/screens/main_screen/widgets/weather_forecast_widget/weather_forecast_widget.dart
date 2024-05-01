import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/src/di/providers.dart';
import 'package:weather_app/src/presentation/screens/main_screen/state_managment/main_screen_state.dart';
import 'package:weather_app/src/presentation/screens/main_screen/widgets/weather_forecast_widget/weather_forecast_card.dart';

class WeatherForecastWidget extends ConsumerWidget {
  const WeatherForecastWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(mainScreenStateNotifierProvider.notifier);
    final state = ref.watch(mainScreenStateNotifierProvider);

    final MainScreenState(
      :location,
      :detailWeather,
      :fetchError,
    ) = state;

    final colorSheme = Theme.of(context).colorScheme;

    //TODO divide to separated widget

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        fetchError != null
            ? Text(
                fetchError,
                style: TextStyle(
                  color: colorSheme.error,
                ),
              )
            : location != null && detailWeather != null
                ? WeatherForecastCard(
                    location: location,
                    detailWeather: detailWeather,
                  )
                : const CircularProgressIndicator(),
        const SizedBox(height: 10),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: notifier.onRefreshWeathreClick,
              icon: Icon(
                Icons.refresh,
                color: colorSheme.primary,
              ),
            ),
          ],
        )
      ],
    ));
  }
}
