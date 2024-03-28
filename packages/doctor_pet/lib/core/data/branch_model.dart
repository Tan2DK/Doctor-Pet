import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class BranchModel {
  final String id;
  final String name;
  final String address;
  // final LatLng latlng;
  const BranchModel({
    required this.id,
    required this.name,
    required this.address,
    // required this.latlng,
  });

  

  // double get lat => latlng.latitude;
  // double get lng => latlng.longitude;

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'address': address});
  
    return result;
  }

  factory BranchModel.fromMap(Map<String, dynamic> map) {
    return BranchModel(
      id: map['clinicId'] ?? '',
      name: map['clinicName'] ?? '',
      address: map['address'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory BranchModel.fromJson(String source) => BranchModel.fromMap(json.decode(source));
}
