import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:weather_app/src/domain/entity/location.dart';

abstract final class _Keys {
  static const allLocation = 'allLocations';
  static const mainLocation = 'mainLocation';
}

final class LocationCacheClient {
  LocationCacheClient(this._sharedPreferences);

  final SharedPreferences _sharedPreferences;

  void putLocations(List<Location> locations) {
    final rawData =
        locations.map((location) => jsonEncode(location.toJson())).toList();

    _sharedPreferences.setStringList(_Keys.allLocation, rawData);
  }

  List<Location>? getLocations() {
    final rawData = _sharedPreferences.getStringList(_Keys.allLocation);

    if (rawData == null) return null;

    final data = rawData
        .map((rawLocation) =>
            Location.fromJson(rawLocation as Map<String, Object?>))
        .toList();

    return data;
  }

  void putMainLocation(Location location) {
    final rawData = jsonEncode(location.toJson());

    _sharedPreferences.setString(_Keys.mainLocation, rawData);
  }

  Location? getMainLocation() {
    final rawData = _sharedPreferences.getString(_Keys.mainLocation);

    if (rawData == null) return null;

    final data = Location.fromJson(jsonDecode(rawData) as Map<String, Object?>);

    return data;
  }
}
