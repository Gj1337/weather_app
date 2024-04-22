import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/src/di/providers.dart';

class ThemeModeWidget extends ConsumerWidget {
  const ThemeModeWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(settingsStateNotifierProvider.notifier);
    final appThemeInfo = ref.watch(
        settingsStateNotifierProvider.select((state) => state.appThemeInfo));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(LocaleKeys.appThemeMode.tr()),
        DropdownButton<ThemeMode>(
          value: appThemeInfo.themeMode,
          items: [
            DropdownMenuItem<ThemeMode>(
              value: ThemeMode.dark,
              child: Text(LocaleKeys.themeMode_dark.tr()),
            ),
            DropdownMenuItem<ThemeMode>(
              value: ThemeMode.light,
              child: Text(LocaleKeys.themeMode_light.tr()),
            ),
            DropdownMenuItem<ThemeMode>(
              value: ThemeMode.system,
              child: Text(LocaleKeys.themeMode_sysytem.tr()),
            ),
          ],
          onChanged: (themeMode) {
            if (themeMode != null) {
              notifier.onThemeModeChanged(themeMode);
            }
          },
        ),
      ],
    );
  }
}
