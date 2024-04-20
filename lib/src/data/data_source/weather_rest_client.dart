import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/src/data/entity/repsonce/current_weather_responce.dart';

part 'weather_rest_client.g.dart';

@RestApi(baseUrl: 'https://api.open-meteo.com/v1')
abstract class WeatherRestClient {
  factory WeatherRestClient(Dio dio, {String baseUrl}) = _WeatherRestClient;

  @GET('/forecast')
  Future<CurrentWeatherResponce> getCurrentWeather(
    @Query('latitude') double latitude,
    @Query('longitude') double longitude, {
    //TODO add entity
    @Query('current') String current = 'temperature_2m,'
        'relative_humidity_2m,'
        'wind_speed_10m,'
        'wind_direction_10m',
  });
}
