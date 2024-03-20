// File: doctor_medicine.dart
import 'package:doctor_pet/core/data/medicine.dart';

final List<Medicine> mockMedicines = [
  Medicine(
    medicineId: '05',
    medicineName: 'Ibuprofen',
    medicineUnit: 'Tablets',
    prices: 8,
    inventory: 100,
    specifications: 'Pharmaco',
    medicineCateId: 'PainRelief',
  ),
  Medicine(
    medicineId: '06',
    medicineName: 'Acetaminophen',
    medicineUnit: 'Tablets',
    prices: 3,
    inventory: 150,
    specifications: 'Medicorp',
    medicineCateId: 'PainRelief',
  ),
];
