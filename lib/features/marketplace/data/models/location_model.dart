import '../../domain/entities/location_entity.dart';

class LocationModel {
  final double latitude;
  final double longitude;
  final String address;
  LocationModel({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  Location toEntity() => Location(
        latitude: latitude,
        longitude: longitude,
        address: address,
      );
}
