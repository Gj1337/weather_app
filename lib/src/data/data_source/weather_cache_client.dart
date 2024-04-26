import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/domain/entity/detail_weather.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/domain/entity/simple_weather.dart';

abstract final class _Keys {
  static const weatherDetailed = 'weather-detailed';
  static const weatherSimple = 'weather-simple';
}

final class WeatherCacheClient {
  WeatherCacheClient(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  void putDetailWeather({
    required Location location,
    required DetailWeather detailWeather,
  }) {
    final rawData = jsonEncode(detailWeather.toJson());

    _sharedPreferences.setString(_detailWeatherKey(location), rawData);
  }

  DetailWeather? getDetailWeather({required Location location}) {
    final rawData = _sharedPreferences.getString(_detailWeatherKey(location));

    if (rawData == null) return null;

    final data =
        DetailWeather.fromJson(jsonDecode(rawData) as Map<String, Object?>);

    return data;
  }

  Future<bool> removeDetailWeather({required Location location}) async {
    return _sharedPreferences.remove(_detailWeatherKey(location));
  }

  String _detailWeatherKey(Location location) =>
      '${_Keys.weatherDetailed}-${location.id}';

  Future<Map<Location, SimpleWeather>?> getSimpleWeatherList() async {
    final rawData = _sharedPreferences.getString(_Keys.weatherSimple);

    if (rawData == null) return null;

    final data = (jsonDecode(rawData) as Map<String, dynamic>).map(
      (rawLocation, rawWeather) => MapEntry(
        Location.fromJson(jsonDecode(rawLocation) as Map<String, dynamic>),
        SimpleWeather.fromJson(jsonDecode(rawWeather) as Map<String, dynamic>),
      ),
    );

    return data;
  }

  Future<void> putSimpleWeatherList(
      {required Map<Location, SimpleWeather?> simpleWeatherRecords}) async {
    final rawData = jsonEncode(
      simpleWeatherRecords.map(
        (location, weather) => MapEntry(
          jsonEncode(location.toJson()),
          jsonEncode(weather?.toJson()),
        ),
      ),
    );

    _sharedPreferences.setString(_Keys.weatherSimple, rawData);
  }
}
