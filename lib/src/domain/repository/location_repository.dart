import 'package:weather_app/src/domain/entity/location.dart';

abstract interface class LocationRepository {
  Future<List<Location>> getLocationsByName(String name);

  Future<Location?> getCachedMainLocation();

  Future<List<Location>?> getCachedLocations();

  Future<void> putCachedMainLocation(Location location);

  Future<void> putCachedLocations(List<Location> locations);
}
