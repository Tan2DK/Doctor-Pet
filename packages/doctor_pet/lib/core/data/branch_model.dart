import 'package:google_maps_flutter/google_maps_flutter.dart';

class BranchModel {
  final String id;
  final String name;
  final String address;
  final LatLng latlng;
  const BranchModel({
    required this.id,
    required this.name,
    required this.address,
    required this.latlng,
  });

  double get lat => latlng.latitude;
  double get lng => latlng.longitude;
}
