import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/src/di/providers.dart';

class AppThemeBuilder extends ConsumerWidget {
  const AppThemeBuilder({
    super.key,
    required this.builder,
  });

  final Widget Function(
    BuildContext context,
    ThemeData lightTheme,
    ThemeData dartTheme,
    ThemeMode themeMode,
  ) builder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appThemeInfo = ref.watch(
      settingsStateNotifierProvider.select((state) => state.appThemeInfo),
    );

    final lightTheme = ThemeData(colorSchemeSeed: appThemeInfo.colorSeed);
    final darkTheme = ThemeData(
      brightness: Brightness.dark,
      colorSchemeSeed: appThemeInfo.colorSeed,
    );

    return builder(
      context,
      lightTheme,
      darkTheme,
      appThemeInfo.themeMode,
    );
  }
}
