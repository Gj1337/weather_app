import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/src/di/providers.dart';
import 'package:weather_app/src/presentation/common/screen_size_provider.dart';
import 'package:weather_app/src/presentation/entity/animation_speed.dart';
import 'package:weather_app/src/presentation/entity/screen_size.dart';
import 'package:weather_app/src/presentation/screens/main_screen/widgets/narrow_main_screen_widget.dart';
import 'package:weather_app/src/presentation/screens/main_screen/widgets/wide_main_screen_widget.dart';

class MainScreen extends HookConsumerWidget {
  const MainScreen({super.key});

  void _onListScreenPickNewMainScreenListener(WidgetRef ref) {
    ref.listen(
      listScreenStateNotifierProvider
          .select((listSceenState) => listSceenState.mainLocation),
      (previosMainLocation, currentMainLocation) {
        if (currentMainLocation != previosMainLocation) {
          final mainScreenNotifier =
              ref.read(mainScreenStateNotifierProvider.notifier);

          mainScreenNotifier.onMainLocationChanged(currentMainLocation);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    _onListScreenPickNewMainScreenListener(ref);

    final mainScreenNotifier =
        ref.watch(mainScreenStateNotifierProvider.notifier);
    final screenSize = ref.watch(screenSizeProvider);

    useEffect(() {
      mainScreenNotifier.setup();

      return null;
    }, []);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: AnimatedSwitcher(
            duration: AnimationSpeed.fast.duration,
            child: switch (screenSize) {
              ScreenSize.small => const NarrowMainScreen(),
              ScreenSize.big => const WideMainScreenWidget()
            },
          ),
        ),
      ),
    );
  }
}
