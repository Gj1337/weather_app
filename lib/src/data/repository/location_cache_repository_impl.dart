import 'package:weather_app/src/data/data_source/location_cache_client.dart';
import 'package:weather_app/src/domain/entity/location.dart';
import 'package:weather_app/src/domain/repository/location_cache_repository.dart';

final class LocationCacheRepositoryImpl implements LocationCacheRepository {
  LocationCacheRepositoryImpl(
    this._locationCachedClient,
  );

  final LocationCacheClient _locationCachedClient;

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

  @override
  Future<void> removeCachedMainLocation() =>
      _locationCachedClient.removeMainLocation();
}
