import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:doctor_pet/views/doctor/doctor_controller.dart';

class MypatientsView extends GetView<DoctorController> {
  const MypatientsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DoctorController>();
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text('My Patients View'),
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
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: const Text(
                'View My Patients',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SingleChildScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  child: SizedBox(
                    width: screenWidth,
                    child: ConstrainedBox(
                      constraints:
                          BoxConstraints(maxWidth: 1200), // Limit maximum width
                      child: DataTable(
                        columnSpacing: 10,
                        horizontalMargin: 10,
                        dataRowHeight: 50,
                        columns: const [
                          DataColumn(label: Text('ID Customer')),
                          DataColumn(label: Text('Name')),
                          DataColumn(label: Text('Phone Number')),
                          DataColumn(label: Text('Birthday')),
                          DataColumn(label: Text('Address')),
                          DataColumn(label: Text('Date Buy')),
                        ],
                        rows: controller.myPatients.map((patient) {
                          return DataRow(cells: [
                            DataCell(Text(patient.customerId)),
                            DataCell(Text(patient.name)),
                            DataCell(Text(patient.phoneNumber)),
                            DataCell(Text(DateFormat('yyyy-MM-dd')
                                .format(patient.birthday))),
                            DataCell(Text(patient.address)),
                            DataCell(Text(DateFormat('yyyy-MM-dd')
                                .format(patient.dateBuyMedicine))),
                          ]);
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
