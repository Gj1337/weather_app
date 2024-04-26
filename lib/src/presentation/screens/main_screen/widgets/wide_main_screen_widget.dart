import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/src/di/providers.dart';
import 'package:weather_app/src/presentation/screens/list_screen/list_screen.dart';
import 'package:weather_app/src/presentation/screens/main_screen/widgets/narrow_main_screen_widget.dart';
import 'package:weather_app/src/weather_app.dart';

class WideMainScreenWidget extends ConsumerWidget {
  const WideMainScreenWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainScreenLocation = ref.watch(
        mainScreenStateNotifierProvider.select((state) => state.location));

    return Stack(
      children: [
        Row(
          children: [
            if (mainScreenLocation != null)
              const SizedBox(width: 400, child: ListScreen()),
            const Expanded(child: NarrowMainScreen()),
          ],
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            onPressed: () => context.goNamed(Routes.settingsScreen.name),
            icon: const Icon(Icons.settings),
          ),
        ),
      ],
    );
  }
}
