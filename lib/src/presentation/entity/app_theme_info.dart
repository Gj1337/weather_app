import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'app_theme_info.freezed.dart';
part 'app_theme_info.g.dart';

@freezed
class AppThemeInfo with _$AppThemeInfo {
  AppThemeInfo._();

  factory AppThemeInfo({
    @ColorConverter() required Color colorSeed,
    @Default(ThemeMode.system) ThemeMode themeMode,
  }) = _AppThemeInfo;

  factory AppThemeInfo.fromJson(Map<String, Object?> json) =>
      _$AppThemeInfoFromJson(json);
}

class ColorConverter implements JsonConverter<Color, int> {
  const ColorConverter();

  @override
  Color fromJson(int json) => Color(json);

  @override
  int toJson(Color object) => object.value;
}
