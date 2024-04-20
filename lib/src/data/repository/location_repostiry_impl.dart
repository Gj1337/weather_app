import 'package:weather_app/src/data/data_source/location_rest_client.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/domain/repository/location_repository.dart';

final class NetworkLocationRepositoryImpl implements LocationRepository {
  NetworkLocationRepositoryImpl(this._locationRestClient);

  final LocationRestClient _locationRestClient;

  @override
  Future<List<Location>> getLocationsByName(String name,
      //TODO add locale supporting
      {String language = 'en'}) async {
    final locationsResonce = await _locationRestClient.getLocations(
      name,
      50,
      language,
    );

    return locationsResonce.results ?? [];
  }
}
