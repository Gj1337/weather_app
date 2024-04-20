import 'package:weather_app/src/data/data_source/weather_rest_client.dart';
import 'package:weather_app/src/domain/entity/current_weather.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/domain/repository/weather_repository.dart';

final class NetworkWeatherRepositoryImpl implements WeatherRepository {
  NetworkWeatherRepositoryImpl(this._weatherRestClient);

  final WeatherRestClient _weatherRestClient;

  @override
  Future<CurrentWeather> getCurrentWeather({required Location location}) async {
    final currentWeatherResponce = await _weatherRestClient.getCurrentWeather(
      location.latitude,
      location.longitude,
    );

    return CurrentWeather(
      currentWeatherValues: currentWeatherResponce.currentWeatherValues,
      currentUnits: currentWeatherResponce.currentWeatherUnits,
    );
  }
}
