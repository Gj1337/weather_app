import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/domain/entity/current_weather.dart';

abstract final class _Keys {
  static const weather = 'weather';
}

final class WeatherCacheClient {
  WeatherCacheClient(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  void putCurrentWeather(CurrentWeather currentWeather) {
    final rawData = jsonEncode(currentWeather.toJson());

    _sharedPreferences.setString(_Keys.weather, rawData);
  }

  CurrentWeather? getCurrentWeather() {
    final rawData = _sharedPreferences.getString(_Keys.weather);

    if (rawData == null) return null;

    final data =
        CurrentWeather.fromJson(jsonDecode(rawData) as Map<String, Object?>);

    return data;
  }
}
