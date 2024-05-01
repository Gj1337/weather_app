import 'package:weather_app/src/domain/entity/location.dart';

abstract interface class LocationCacheRepository {
  Future<Location?> getCachedMainLocation();

  Future<void> putCachedMainLocation(Location location);

  Future<void> removeCachedMainLocation();

  Future<void> putCachedLocations(List<Location> locations);

  Future<List<Location>?> getCachedLocations();
}
