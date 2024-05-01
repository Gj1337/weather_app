import 'package:weather_app/src/domain/entity/location.dart';

abstract interface class LocationNetworkRepository {
  Future<List<Location>> getLocationsByName(String name);
}
