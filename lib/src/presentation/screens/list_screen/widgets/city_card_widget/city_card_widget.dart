import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/src/di/providers.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/presentation/screens/list_screen/widgets/city_card_widget/city_card_menu_widget.dart';
import 'package:weather_app/src/presentation/screens/list_screen/widgets/city_card_widget/city_card_weather_info_widget.dart';

class CityCardWidget extends ConsumerWidget {
  const CityCardWidget({super.key, required this.location});

  final Location location;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(listScreenStateNotifierProvider.notifier);
    final state = ref.watch(listScreenStateNotifierProvider);

    final simpleWeather = state.cityWithForecast[location];

    final isMainLocation = state.mainLocation == location;

    final cityNameTextStyle = TextStyle(
      color: Theme.of(context).colorScheme.secondary,
      fontSize: 20,
    );

    return Card(
      clipBehavior: Clip.hardEdge,
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 400,
          height: 120,
          child: InkWell(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(location.name, style: cityNameTextStyle),
                    Row(
                      children: [
                        if (isMainLocation)
                          Text(
                            'Main',
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.secondary,
                                fontStyle: FontStyle.italic),
                          ),
                        CityCardMenuWidget(
                          onDeleteClick: () =>
                              notifier.onLocationDeletedClick(location),
                          onSetMainClick: !isMainLocation
                              ? () => notifier.onMainLocationPicked(location)
                              : null,
                        ),
                      ],
                    ),
                  ],
                ),
                if (simpleWeather != null)
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: CityCardWeatherInfoWidget(
                          simpleWeather: simpleWeather)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
