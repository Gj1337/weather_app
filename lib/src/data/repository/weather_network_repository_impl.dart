import 'dart:convert';

import 'package:weather_app/src/data/data_source/weather_rest_client.dart';
import 'package:weather_app/src/data/entity/repsonce/simple_weather_responce.dart';
import 'package:weather_app/src/domain/entity/detail_weather.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/domain/entity/simple_weather.dart';
import 'package:weather_app/src/domain/repository/weather_network_repository.dart';

final class WeatherNewtorkRepositoryImpl implements WeatherNewtorkRepository {
  WeatherNewtorkRepositoryImpl(
    this._weatherRestClient,
  );

  final WeatherRestClient _weatherRestClient;

  @override
  Future<DetailWeather> getDetailWeather({required Location location}) async {
    final currentWeatherResponce = await _weatherRestClient.getDetailedWeather(
      location.latitude,
      location.longitude,
    );

    return DetailWeather(
      detailWeatherValues: currentWeatherResponce.detailWeatherValues,
      detailWeatherUnits: currentWeatherResponce.detailWeatherUnits,
      hourlyForecast: currentWeatherResponce.hourlyForecast,
    );
  }

  @override
  Future<List<SimpleWeather>> getSimpleWeathers(
      {required List<Location> locations}) async {
    final rawSimpleWeatherResponce = await _weatherRestClient.getSimpleWeather(
      locations.map((location) => location.latitude).toList(),
      locations.map((location) => location.longitude).toList(),
    );

    final rawJson = jsonDecode(rawSimpleWeatherResponce);

    final json = rawJson is List<dynamic>
        ? rawJson.map((e) => e as Map<String, dynamic>)
        : [rawJson as Map<String, dynamic>];

    final simpleWeatherResponce =
        json.map((json) => SimpleWeatherResponce.fromJson(json)).toList();

    return simpleWeatherResponce
        .map(
          (simpleWeatherResponce) => SimpleWeather(
            simpleWeatherUnits: simpleWeatherResponce.simpleWeatherUnits,
            simpleWeatherValues: simpleWeatherResponce.simpleWeatherValues,
          ),
        )
        .toList();
  }
}
