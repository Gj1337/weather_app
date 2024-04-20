import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/src/di/providers.dart';
import 'package:weather_app/src/presentation/screens/main_screen/state_managment/main_screen_state.dart';
import 'package:weather_app/src/presentation/screens/main_screen/widgets/weather_forecast_widget/weather_forecast_card.dart';
import 'package:weather_app/src/weather_app.dart';

class WeatherForecastWidget extends ConsumerWidget {
  const WeatherForecastWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(mainScreenStateNotifierProvider);

    final MainScreenState(
      :location,
      :currentWeather,
      :fetchError,
    ) = state;

    //TODO divide to separated widget

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        fetchError != null
            ? Text(
                fetchError,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              )
            : location != null && currentWeather != null
                ? FittedBox(
                    child: WeatherForecastCard(
                    location: location,
                    currentWeather: currentWeather,
                  ))
                : const CircularProgressIndicator(),
        const SizedBox(height: 10),
        TextButton(
          onPressed: () => context.goNamed(Routes.pickCityScreen.name),
          child: Text(LocaleKeys.anotherLocation.tr()),
        )
      ],
    ));
  }
}
