import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_app/src/data/entity/repsonce/posible_locations_responce.dart';

part 'location_rest_client.g.dart';

@RestApi(baseUrl: 'https://geocoding-api.open-meteo.com/v1')
abstract class LocationRestClient {
  factory LocationRestClient(Dio dio, {String baseUrl}) = _LocationRestClient;

  @GET('/search')
  Future<PosibleLocationsResponce> getLocations(
    @Query('name') String name,
    @Query('count') int count,
    @Query('language') String language,
  );
}
