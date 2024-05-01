import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:weather_app/generated/locale_keys.g.dart';
import 'package:weather_app/src/presentation/common/back_arrow_button.dart';
import 'package:weather_app/src/presentation/common/screen_size_provider.dart';
import 'package:weather_app/src/presentation/entity/animation_speed.dart';
import 'package:weather_app/src/presentation/entity/screen_size.dart';
import 'package:weather_app/src/presentation/screens/settings_screen/widgets/theme_main_color_widget.dart';
import 'package:weather_app/src/presentation/screens/settings_screen/widgets/theme_mode_widget.dart';

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
      body: Align(
        alignment: Alignment.topCenter,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          width: 500,
          child: const SingleChildScrollView(
            child: Column(
              children: [
                ThemeModeWidget(),
                ThemeMainColorWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
