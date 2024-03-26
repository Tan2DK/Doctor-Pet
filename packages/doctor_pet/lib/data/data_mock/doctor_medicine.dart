import 'package:doctor_pet/core/data/medicine.dart';

final List<Medicine> mockMedicines = [
  Medicine(
    idMedicine: '01',
    nameMedicine: 'Panadol',
    medicineCateId: '1',
    price: '5.00',
    inventory: '50',
    medicineUnit: 'box',
    specifications: 'For fever and pain relief',
  ),
  Medicine(
    idMedicine: '02',
    nameMedicine: 'Amoxicillin',
    medicineCateId: '2',
    price: '10.00',
    inventory: '40',
    medicineUnit: 'bottle',
    specifications: 'Antibiotic for bacterial infections',
  ),
  Medicine(
    idMedicine: '03',
    nameMedicine: 'Metformin',
    medicineCateId: '3',
    price: '15.00',
    inventory: '30',
    medicineUnit: 'bottle',
    specifications: 'For type 2 diabetes',
  ),
  Medicine(
    idMedicine: '04',
    nameMedicine: 'Cetirizine',
    medicineCateId: '4',
    price: '8.00',
    inventory: '60',
    medicineUnit: 'box',
    specifications: 'For allergic reactions',
  ),
];
