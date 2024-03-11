import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../doctor/doctor_controller.dart'; // Đảm bảo đường dẫn chính xác

class DoctorView extends GetView<DoctorController> {
  const DoctorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Lấy kích thước màn hình
    var screenWidth = MediaQuery.of(context).size.width;

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
                'View Doctor Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    width: screenWidth, // Sử dụng chiều rộng màn hình
                    child: DataTable(
                      columnSpacing: 38, // Điều chỉnh khoảng cách giữa các cột
                      columns: const [
                        DataColumn(label: Text('ID customer')),
                        DataColumn(label: Text('Name')),
                        DataColumn(label: Text('Email')),
                        DataColumn(label: Text('Phone')),
                        DataColumn(label: Text('Accepted')),
                      ],
                      rows: List<DataRow>.generate(
                        controller.doctors.length,
                        (index) => DataRow(
                          cells: <DataCell>[
                            DataCell(
                                Text(controller.doctors[index].idcustomer)),
                            DataCell(
                                Text(controller.doctors[index].namedoctor)),
                            DataCell(Text(controller.doctors[index].email)),
                            DataCell(Text(controller.doctors[index].phonenum)),
                            DataCell(Checkbox(
                              value: controller.doctors[index].accepted,
                              onChanged: (newValue) {
                                controller.toggleAcceptedStatus(
                                    index, newValue ?? false);
                              },
                            )),
                          ],
                        ),
                      ),
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
