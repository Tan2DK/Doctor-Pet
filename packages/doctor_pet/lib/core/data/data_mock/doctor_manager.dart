// File: doctor_manager.dart

import 'package:doctor_pet/core/data/doctor.dart';

final List<doctor> mockDoctors = [
  doctor(
    day: DateTime(2017, 9, 7),
    idcustomer: '1',
    namedoctor: 'Duy',
    email: 'tranduy@example.com',
    phonenum: '091637238',
    accepted: false,
  ),
  doctor(
    day: DateTime(2018, 4, 16),
    idcustomer: '2',
    namedoctor: 'Kep',
    email: 'kep@example.com',
    phonenum: '0919028212',
    accepted: false,
  ),
  // Thêm các bác sĩ khác theo mẫu trên
];
