import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:doctor_pet/views/doctor/doctor_mypatients/doctor_mypatients_controller.dart';

class MyPatientsView extends GetView<MyPatientsController> {
  const MyPatientsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<MyPatientsController>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 254, 234, 234),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            // const SizedBox(height: 10),
            // const Center(
            //   child: Text(
            //     'View My Patients',
            //     style: TextStyle(
            //       fontSize: 24,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            const SizedBox(height: 10),
            const Row(
              children: [
                SizedBox(width: 70),
                Text(
                  'View My Patients',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() => SingleChildScrollView(
                    child: DataTable(
                      columnSpacing: 50,
                      horizontalMargin: 10,
                      dataRowHeight: 50,
                      columns: const [
                        DataColumn(label: Text('ID Customer')),
                        DataColumn(label: Text('Pet Name')),
                        DataColumn(label: Text('Pet Age')),
                        DataColumn(label: Text('Pet Species')),
                        DataColumn(label: Text('Pet Color')),
                        DataColumn(label: Text('Date Buy Medicine')),
                        DataColumn(label: Text('Details')),
                      ],
                      rows: controller.myPatients.value.map((patient) {
                        return DataRow(cells: [
                          DataCell(Text(patient.customerId)),
                          DataCell(Text(patient.petName)),
                          DataCell(Text(patient.petAge)),
                          DataCell(Text(patient.petSpecies)),
                          DataCell(Text(patient.petColor)),
                          DataCell(Text(DateFormat('yyyy-MM-dd')
                              .format(patient.dateBuyMedicine))),
                          DataCell(IconButton(
                            icon: const Icon(Icons.account_balance),
                            onPressed: () =>
                                controller.showDetails(patient.details),
                          )),
                        ]);
                      }).toList(),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
