import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/src/presentation/common/screen_size_provider.dart';
import 'package:weather_app/src/presentation/domain/screen_size.dart';
import 'package:weather_app/src/weather_app.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screeSize = ref.watch(screenSizeProvider);

    return Scaffold(
      appBar: AppBar(
        leading: AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          child: screeSize == ScreenSize.big
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () {
                    context.go(Routes.mainScreen);
                  },
                )
              : null,
        ),
        title: Text(LocaleKeys.screensTitle_settings.tr()),
      ),
      body: Center(
        child: Text(LocaleKeys.screensTitle_settings.tr()),
      ),
    );
  }
}
