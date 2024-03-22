import 'package:doctor_pet/core/data/staff.dart';

import '../../core/data/clinic.dart';

final List<Clinic> mockClinic = [
  Clinic(
    clinicId: '1',
    clinicName: 'D Care',
    address: 'Dong Thap',
    clinicPhoneNumber: '0445566',
    email: 'email',
    staff: Staff(
      name: 'Nguyen Van A',
      address: 'Viet Nam',
      phone: '01122334455',
      status: true,
      birthday: DateTime(2022, 9, 7),
    ),
  ),
  Clinic(
      clinicId: '2',
      clinicName: 'D Care 2',
      address: 'Can Tho',
      clinicPhoneNumber: '01122334455',
      email: 'email',
      staff: Staff(
      name: 'Nguyen Van A',
      address: 'Viet Nam',
      phone: '01122334455',
      status: true,
      birthday: DateTime(2022, 9, 7),
    ),),
  Clinic(
      clinicId: '3',
      clinicName: 'D Care 3',
      address: 'Viet Nam',
      clinicPhoneNumber: '01122334455',
      email: 'email',
      staff: Staff(
      name: 'Nguyen Van A',
      address: 'Viet Nam',
      phone: '01122334455',
      status: true,
      birthday: DateTime(2022, 9, 7),
    ),),
  Clinic(
      clinicId: '4',
      clinicName: 'D Care 4',
      address: 'Viet Nam',
      clinicPhoneNumber: '022556677',
      email: 'email',
      staff: Staff(
      name: 'Nguyen Van A',
      address: 'Viet Nam',
      phone: '01122334455',
      status: true,
      birthday: DateTime(2022, 9, 7),
    ),),
];
