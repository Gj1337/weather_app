import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:weather_app/src/presentation/entity/app_theme_info.dart';

part 'settings_state.freezed.dart';
part 'settings_state.g.dart';

@freezed
class SettingsState with _$SettingsState {
  factory SettingsState({
    required AppThemeInfo appThemeInfo,
  }) = _SettingsState;

  factory SettingsState.fromJson(Map<String, Object?> json) =>
      _$SettingsStateFromJson(json);
}
