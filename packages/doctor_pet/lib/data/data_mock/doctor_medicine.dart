// File: doctor_medicine.dart
import 'package:doctor_pet/core/data/medicine.dart';

final List<Medicine> mockMedicines = [
  Medicine(
    dateMedicine: DateTime(2018, 01, 10),
    idMedicine: '05',
    nameMedicine: 'Ibuprofen',
    companyMedicineName: 'Pharmaco',
    expirationdate: '12/2026',
    price: '8',
  ),
  Medicine(
    dateMedicine: DateTime(2019, 02, 15),
    idMedicine: '06',
    nameMedicine: 'Acetaminophen',
    companyMedicineName: 'Medicorp',
    expirationdate: '11/2024',
    price: '3',
  ),
  // Thêm các mục medicine khác tương tự
];
