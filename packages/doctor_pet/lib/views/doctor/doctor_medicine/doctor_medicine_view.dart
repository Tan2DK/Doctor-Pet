import 'package:doctor_pet/utils/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:doctor_pet/views/doctor/doctor_medicine/doctor_medicine_controller.dart'; // Make sure this path matches where your file is located
import 'package:doctor_pet/core/data/medicine.dart'; // Make sure this path matches where your file is located

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
              padding: const EdgeInsets.symmetric(
                  horizontal: 20), // Adjust based on your layout needs
              child: Row(
                mainAxisAlignment: MainAxisAlignment
                    .spaceBetween, // This will space out your children as far apart as possible
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
                          .showAddMedicineDialog(); // Make sure this method exists in your controller
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          Colors.blue, // Background color of the button
                      foregroundColor: Colors.white, // Text color
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
                      DataColumn(
                          label: Text('IDMedi',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Name',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Quantity',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Expiration Date',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Import Date',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Price',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold))),
                    ],
                    rows: medicines.map<DataRow>((Medicine medicine) {
                      return DataRow(cells: [
                        DataCell(Text(medicine.idMedicine)),
                        DataCell(Text(medicine.nameMedicine)),
                        DataCell(Text(medicine.quantity)),
                        DataCell(Text(
                            medicine.importDate.formatDateTime('dd-MM-yyyy'))),
                        DataCell(Text(medicine.expirationDate
                            .formatDateTime('dd-MM-yyyy'))),
                        DataCell(Text('\$${medicine.price.toString()}')),
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
