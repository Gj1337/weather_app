import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/src/di/providers.dart';
import 'package:weather_app/src/presentation/screens/list_screen/widgets/add_new_city_widget.dart';
import 'package:weather_app/src/presentation/screens/list_screen/widgets/city_card_widget/city_card_widget.dart';

class ListScreen extends HookConsumerWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(listScreenStateNotifierProvider.notifier);
    final state = ref.watch(listScreenStateNotifierProvider);

    final cities = state.cityWithForecast.keys
        .map<Widget>((location) => CityCardWidget(location: location))
        .toList();

    cities.add(const AddNewCityWidget());

    useEffect(() {
      notifier.setup();

      return null;
    }, []);

    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          child: Column(children: cities),
        ),
      ),
    );
  }
}
