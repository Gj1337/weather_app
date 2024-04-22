import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/presentation/entity/app_theme_info.dart';
import 'package:weather_app/src/presentation/screens/settings_screen/state_managment/settings_state.dart';
import 'package:weather_app/src/utils/logger_mixin.dart';

const _defaultColor = Colors.deepPurple;

const _settingKey = 'appSettings';

final class SettingsNotifier extends StateNotifier<SettingsState>
    with LoggerMixin {
  SettingsNotifier(
    this._sharedPreferences,
  ) : super(
          SettingsState(
            appThemeInfo: AppThemeInfo(colorSeed: _defaultColor),
          ),
        ) {
    onCreate();
  }

  final SharedPreferences _sharedPreferences;

  void onCreate() {
    logger.i('onCreate');

    final rawData = _sharedPreferences.getString(_settingKey);

    if (rawData != null) {
      try {
        final settingsState = SettingsState.fromJson(jsonDecode(rawData));

        state = settingsState;
      } catch (exception) {
        logger.e('onCreate caught $exception');
      }
    }
  }

  void onPrimaryColorChanged(Color color) {
    logger.i('onPrimaryColorChanged $color');

    state = state.copyWith.appThemeInfo(
      colorSeed: color,
    );

    _cacheSettings();
  }

  void onThemeModeChanged(ThemeMode themeMode) {
    logger.i('onThemeModeChanged $themeMode');

    state = state.copyWith.appThemeInfo(themeMode: themeMode);

    _cacheSettings();
  }

  _cacheSettings() {
    final rawData = jsonEncode(state.toJson());

    _sharedPreferences.setString(_settingKey, rawData);
  }
}
