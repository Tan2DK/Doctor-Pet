import 'package:doctor_pet/core/data/staff.dart';

class Clinic {
  String clinicId;
  String clinicName;
  String address;
  String clinicPhoneNumber;
  String email;
  String adminId;
  Clinic(
      {required this.clinicId,
      required this.clinicName,
      required this.address,
      required this.clinicPhoneNumber,
      required this.email,
      required this.adminId});
}
