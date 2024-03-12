// File: doctor_manager.dart

import 'package:doctor_pet/core/data/doctor.dart';

final List<doctor> mockDoctors = [
  doctor(
    day: DateTime(2017, 9, 7),
    idCustomer: '1',
    nameCustomer: 'Duy',
    email: 'tranduy@example.com',
    phoneNum: '091637238',
    accepted: false,
  ),
  doctor(
    day: DateTime(2018, 4, 16),
    idCustomer: '2',
    nameCustomer: 'Kep',
    email: 'kep@example.com',
    phoneNum: '0919028212',
    accepted: false,
  ),
  // Thêm các bác sĩ khác theo mẫu trên
];
