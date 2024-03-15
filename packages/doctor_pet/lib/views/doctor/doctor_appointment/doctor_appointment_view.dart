import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/views/doctor/doctor_appointment/doctor_appointment_controller.dart';

class DoctorAppointmentView extends GetView<DoctorAppointmentController> {
  const DoctorAppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color.fromARGB(255, 254, 234, 234),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'View Appointment Management',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                return SingleChildScrollView(
                  child: DataTable(
                    columnSpacing: 38,
                    columns: const [
                      DataColumn(label: Text('ID customer')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Email')),
                      DataColumn(label: Text('Phone')),
                      DataColumn(label: Text('Accepted')),
                    ],
                    rows: List<DataRow>.generate(
                      controller.doctors.value.length,
                      (index) {
                        final doctor = controller.doctors.value[index];
                        return DataRow(
                          cells: <DataCell>[
                            DataCell(Text(doctor.idCustomer)),
                            DataCell(Text(doctor.nameCustomer)),
                            DataCell(Text(doctor.email)),
                            DataCell(Text(doctor.phoneNum)),
                            DataCell(Checkbox(
                              value: doctor.accepted,
                              onChanged: (newValue) {
                                controller.toggleAcceptedStatus(
                                    index, newValue ?? false);
                              },
                            )),
                          ],
                        );
                      },
                    ),
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
