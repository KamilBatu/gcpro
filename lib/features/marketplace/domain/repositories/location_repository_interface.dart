import 'package:gcpro/features/marketplace/domain/entities/location_entity.dart';

abstract class LocationRepository {
  Future<Location> getCurrentLocation();
  Future<List<Location>> getSavedLocation();
  Future<void> saveLocation(Location location);
}
