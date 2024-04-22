import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/src/presentation/common/screen_size_provider.dart';
import 'package:weather_app/src/presentation/entity/animation_speed.dart';
import 'package:weather_app/src/presentation/entity/screen_size.dart';
import 'package:weather_app/src/presentation/screens/main_screen/widgets/narrow_main_screen_widget.dart';
import 'package:weather_app/src/presentation/screens/main_screen/widgets/wide_main_screen_widget.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = ref.watch(screenSizeProvider);

    return Scaffold(
      body: Center(
        child: AnimatedSwitcher(
          duration: AnimationSpeed.fast.duration,
          child: switch (screenSize) {
            ScreenSize.small => const NarrowMainScreen(),
            ScreenSize.big => const WideMainScreenWidget()
          },
        ),
      ),
    );
  }
}
