import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart'; // Import DateFormat from intl package
import 'package:doctor_pet/views/doctor/doctor_controller.dart';

class MedicineView extends GetView<DoctorController> {
  const MedicineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DoctorController>();

    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine View'),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 254, 234, 234),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'View Medicine Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: Obx(() => SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SizedBox(
                      width: screenWidth,
                      child: DataTable(
                        columns: const [
                          DataColumn(label: Text('IDMedi')),
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Medicine Name')),
                          DataColumn(label: Text('Date')),
                          DataColumn(label: Text('Expiration Date')),
                          DataColumn(label: Text('Price')),
                        ],
                        rows: controller.medicines.map((medicine) {
                          return DataRow(cells: [
                            DataCell(Text(medicine.idMedicine)),
                            DataCell(Text(medicine.nameMedicine)),
                            DataCell(Text(medicine.companyMedicineName)),
                            DataCell(Text(DateFormat('yyyy-MM-dd')
                                .format(medicine.dateMedicine))),
                            DataCell(Text(medicine.expirationdate)),
                            DataCell(Text('${medicine.price}')),
                          ]);
                        }).toList(),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
