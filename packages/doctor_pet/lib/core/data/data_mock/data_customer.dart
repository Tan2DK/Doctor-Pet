// data_mock.dart
import 'package:doctor_pet/core/data/pets.dart';
import 'package:doctor_pet/core/data/owner.dart';

import '../../../views/customer/customer_view.dart';
import '../prescription.dart';

final List<Owner> mockOwners = [
  Owner(
    email: 'nhutnmce160255@fpt.edu.vn',
    name: 'Nguyen Minh Nhut',
    phone: '0907552402',
    pet: Pet(
      idPet: '1',
      namePet: 'Lu',
      species: 'Dog',
      alike: 'Viet Nam',
      sex: 'Male',
      color: 'Yellow',
      age: '2',
      dayConsulting: DateTime(2017, 9, 7, 17, 30),
    ),
  ),
];

final List<Prescription> mockPrescriptions = [
  Prescription(
    petName: 'Lu',
    examinationDate: DateTime.now(),
    prescriptionCode: 'RX123',
    diagnosis: 'Fever',
    instructions: 'Take medicine twice a day.',
  ),
];
