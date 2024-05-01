import 'package:weather_app/src/data/data_source/location_rest_client.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/domain/repository/location_network_repository.dart';

final class LocationNetowrkRepositoryImpl implements LocationNetworkRepository {
  LocationNetowrkRepositoryImpl(
    this._locationRestClient,
  );

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
