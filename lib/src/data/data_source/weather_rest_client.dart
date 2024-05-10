import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/src/data/entity/repsonce/detail_weather_responce.dart';

part 'weather_rest_client.g.dart';

@RestApi(baseUrl: 'https://api.open-meteo.com/v1')
abstract class WeatherRestClient {
  factory WeatherRestClient(Dio dio, {String baseUrl}) = _WeatherRestClient;

  @GET('/forecast')
  Future<DetailWeatherResponce> getDetailedWeather(
    @Query('latitude') double latitude,
    @Query('longitude') double longitude, {
    //TODO add entity
    @Query('current') String current = 'temperature_2m,'
        'relative_humidity_2m,'
        'wind_speed_10m,'
        'wind_direction_10m,'
        'weather_code,'
        'is_day',
  });

  @GET('/forecast')
  //Api could return list or object, depends on parameter count
  //that is why stirng, following converting shoul be done in repository
  Future<String> getSimpleWeather(
    @Query('latitude') List<double> latitude,
    @Query('longitude') List<double> longitude, {
    //TODO add entity
    @Query('current') String current = 'temperature_2m,'
        'relative_humidity_2m,'
        'wind_speed_10m,'
        'wind_direction_10m,'
        'weather_code,'
        'is_day',
  });
}
