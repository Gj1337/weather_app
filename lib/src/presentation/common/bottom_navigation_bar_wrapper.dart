import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/src/presentation/common/screen_size_provider.dart';
import 'package:weather_app/src/presentation/domain/animation_speed.dart';
import 'package:weather_app/src/presentation/domain/screen_size.dart';
import 'package:weather_app/src/weather_app.dart';

class ButtonNavigationBarWrapper extends ConsumerWidget {
  const ButtonNavigationBarWrapper({
    super.key,
    required this.child,
    required this.path,
  });

  final Widget child;
  final String? path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = ref.watch(screenSizeProvider);

    final int currentIndex;

    if (path == Routes.mainScreen.path) {
      currentIndex = 0;
    } else if (path == Routes.listScreen.path) {
      currentIndex = 1;
    } else if (path == Routes.settingsScreen.path) {
      currentIndex = 2;
    } else {
      currentIndex = 0;
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(child: child),
          //TODO: replace with SizeTransition
          AnimatedContainer(
            height: screenSize == ScreenSize.small ? 60 : 0,
            duration: AnimationSpeed.fast.duration,
            child: SingleChildScrollView(
              child: BottomNavigationBar(
                onTap: (value) {
                  switch (value) {
                    case 0:
                      context.goNamed(Routes.mainScreen.name);
                    case 1:
                      context.goNamed(Routes.listScreen.name);
                    case 2:
                      context.goNamed(Routes.settingsScreen.name);
                  }
                },
                currentIndex: currentIndex,
                items: [
                  BottomNavigationBarItem(
                    label: LocaleKeys.screensTitle_main.tr(),
                    icon: Icon(
                      currentIndex == 0 ? Icons.home_rounded : Icons.home,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: LocaleKeys.screensTitle_list.tr(),
                    icon: Icon(
                      currentIndex == 1
                          ? Icons.list_alt_rounded
                          : Icons.list_alt,
                    ),
                  ),
                  BottomNavigationBarItem(
                    label: LocaleKeys.screensTitle_settings.tr(),
                    icon: Icon(
                      currentIndex == 2
                          ? Icons.settings_rounded
                          : Icons.settings,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
