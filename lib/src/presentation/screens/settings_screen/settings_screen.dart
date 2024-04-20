import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/src/presentation/common/back_arrow_button.dart';
import 'package:weather_app/src/presentation/common/screen_size_provider.dart';
import 'package:weather_app/src/presentation/domain/animation_speed.dart';
import 'package:weather_app/src/presentation/domain/screen_size.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screeSize = ref.watch(screenSizeProvider);

    return Scaffold(
      appBar: AppBar(
        leading: AnimatedSwitcher(
          duration: AnimationSpeed.fast.duration,
          child: screeSize == ScreenSize.big ? const BackArrowButton() : null,
        ),
        title: Text(LocaleKeys.screensTitle_settings.tr()),
      ),
      body: Center(
        child: Text(LocaleKeys.screensTitle_settings.tr()),
      ),
    );
  }
}
