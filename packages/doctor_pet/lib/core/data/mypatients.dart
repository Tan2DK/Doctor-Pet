import 'package:doctor_pet/core/data/my_patients_details.dart';

class Patients {
  String customerId;
  String petName;
  String petAge;
  String petGender;
  String petColor;
  String petTypeId;
  String petSpecies;
  DateTime dateBuyMedicine;
  PatientsDetails details;

  Patients({
    required this.customerId,
    required this.petName,
    required this.petAge,
    required this.petGender,
    required this.petColor,
    required this.petTypeId,
    required this.petSpecies,
    required this.dateBuyMedicine,
    required this.details,
  });
}
