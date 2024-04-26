import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/src/di/providers.dart';
import 'package:weather_app/src/presentation/entity/animation_speed.dart';
import 'package:weather_app/src/presentation/screens/pick_city_screen/widgets/posible_city_widget.dart';

class PosibleCitiesWidget extends ConsumerWidget {
  const PosibleCitiesWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(pickCityScreenStateNotifierProvider);

    final listScreenNotifier =
        ref.watch(listScreenStateNotifierProvider.notifier);

    final error = state.fetchError;

    return AnimatedSwitcher(
      duration: AnimationSpeed.fast.duration,
      child: error != null
          ? Center(
              child: Text(
              error,
              style: TextStyle(
                color: Theme.of(context).colorScheme.error,
              ),
            ))
          : ListView.builder(
              itemCount: state.possibleCities.length,
              itemBuilder: (_, index) => InkWell(
                onTap: () {
                  listScreenNotifier.onLocationAdded(
                    state.possibleCities[index],
                  );

                  context.pop();
                },
                child: PosibleCityWidget(
                  location: state.possibleCities[index],
                ),
              ),
            ),
    );
  }
}
