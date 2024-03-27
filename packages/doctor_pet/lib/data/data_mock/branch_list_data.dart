import 'package:doctor_pet/core/data/branch_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BranchListData {
  BranchListData._();

  static const List<BranchModel> data = [
    BranchModel(
      id: '1',
      name: 'Q9',
      address: '123 Q9',
      latlng: LatLng(10.8445, 106.8184),
    ),
    BranchModel(
      id: '2',
      name: 'Q2',
      address: '234 Q2',
      latlng: LatLng(10.7889, 106.7497),
    ),
    BranchModel(
      id: '3',
      name: 'TD',
      address: '345 TD',
      latlng: LatLng(10.8526, 106.7557),
    ),
    BranchModel(
      id: '4',
      name: 'ABC',
      address: '456 ABC',
      latlng: LatLng(40.8526, 170.7557),
    ),
    BranchModel(
      id: '5',
      name: 'ABC',
      address: '456 ABC',
      latlng: LatLng(-20.8526, 30.7557),
    ),
  ];
}
