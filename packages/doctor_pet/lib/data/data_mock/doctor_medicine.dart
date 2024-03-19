// File: doctor_medicine.dart
import 'package:doctor_pet/core/data/medicine.dart';

final List<Medicine> mockMedicines = [
  Medicine(
    dateMedicine: DateTime(2018, 01, 10),
    idMedicine: '05',
    nameMedicine: 'Ibuprofen',
    specifications: 'Pharmaco',
    expirationdate: DateTime(2018, 01, 10),
    price: '8',
  ),
  Medicine(
    dateMedicine: DateTime(2019, 02, 15),
    idMedicine: '06',
    nameMedicine: 'Acetaminophen',
    specifications: 'Medicorp',
    expirationdate: DateTime(2018, 01, 10),
    price: '3',
  ),
  // Thêm các mục medicine khác tương tự
];
