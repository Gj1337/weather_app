import 'package:weather_app/src/data/data_source/location_cache_client.dart';
import 'package:weather_app/src/data/data_source/location_rest_client.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/domain/repository/location_repository.dart';

final class LocationRepositoryImpl implements LocationRepository {
  LocationRepositoryImpl(
    this._locationRestClient,
    this._locationCachedClient,
  );

  final LocationRestClient _locationRestClient;
  final LocationCacheClient _locationCachedClient;

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

  @override
  Future<List<Location>?> getCachedLocations() async =>
      _locationCachedClient.getLocations();

  @override
  Future<Location?> getCachedMainLocation() async =>
      _locationCachedClient.getMainLocation();

  @override
  Future<void> putCachedLocations(List<Location> locations) async =>
      _locationCachedClient.putLocations(locations);

  @override
  Future<void> putCachedMainLocation(Location location) async =>
      _locationCachedClient.putMainLocation(location);
}
