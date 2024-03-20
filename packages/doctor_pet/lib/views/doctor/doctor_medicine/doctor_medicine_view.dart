import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:doctor_pet/views/doctor/doctor_medicine/doctor_medicine_controller.dart'; // Đảm bảo đường dẫn đến file này chính xác
import 'package:doctor_pet/core/data/medicine.dart'; // Đảm bảo đường dẫn đến file này chính xác

class DoctorMedicineView extends GetView<DoctorMedicineController> {
  const DoctorMedicineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DoctorMedicineController>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 254, 234, 234),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'View Medicine Information',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      controller
                          .showAddMedicineDialog(); // Đảm bảo phương thức này tồn tại trong controller của bạn
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                    ),
                    child: const Text('Add New Medicine'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                final List<Medicine> medicines = controller.medicines.value;
                return SingleChildScrollView(
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('ID')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Unit')),
                      DataColumn(label: Text('Price')),
                      DataColumn(label: Text('Inventory')),
                      DataColumn(label: Text('Specifications')),
                      DataColumn(label: Text('Category')),
                    ],
                    rows: medicines.map<DataRow>((Medicine medicine) {
                      return DataRow(cells: [
                        DataCell(Text(medicine.medicineId)),
                        DataCell(Text(medicine.medicineName)),
                        DataCell(Text(medicine.medicineUnit)),
                        DataCell(Text('\$${medicine.prices.toString()}')),
                        DataCell(Text(medicine.inventory.toString())),
                        DataCell(Text(medicine.specifications)),
                        DataCell(Text(medicine.medicineCateId)),
                      ]);
                    }).toList(),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
