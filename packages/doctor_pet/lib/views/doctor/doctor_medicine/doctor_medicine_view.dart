import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:doctor_pet/views/doctor/doctor_medicine/doctor_medicine_controller.dart';
import 'package:doctor_pet/core/data/medicine.dart';

class DoctorMedicineView extends GetView<DoctorMedicineController> {
  const DoctorMedicineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DoctorMedicineController>();
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine View'),
        actions: [
          ElevatedButton(
            onPressed: () {
              controller.showAddMedicineDialog();
            },
            child: Text('Add New Medicine'),
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Colors.blue, // Màu nền của nút, có thể điều chỉnh cho phù hợp
              foregroundColor: Colors.white, // Màu chữ trên nút
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    20.0), // Điều chỉnh bán kính góc nếu muốn
              ),
              padding: EdgeInsets.symmetric(
                  horizontal: 10, vertical: 10), // Điều chỉnh padding cho nút
            ),
          ),
        ],
      ),
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
            const Center(
              child: Text(
                'View Medicine Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                final List<Medicine> medicines = controller.medicines.value;
                return SizedBox(
                  width: screenWidth,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('IDMedi')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Company Medicine Name')),
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Expiration Date')),
                      DataColumn(label: Text('Price')),
                    ],
                    rows: medicines.map<DataRow>((medicine) {
                      return DataRow(cells: [
                        DataCell(Text(medicine.idMedicine ?? '')),
                        DataCell(Text(medicine.nameMedicine ?? '')),
                        DataCell(Text(medicine.companyMedicineName ?? '')),
                        DataCell(Text(
                          medicine.dateMedicine != null
                              ? DateFormat('yyyy-MM-dd')
                                  .format(medicine.dateMedicine!)
                              : '',
                        )),
                        DataCell(Text(medicine.expirationdate ?? '')),
                        DataCell(Text('\$${medicine.price ?? ''}')),
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
