import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DoctorView extends StatelessWidget {
  const DoctorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Doctor View'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Patient Management'),
            onTap: () {
              // Điều hướng tới màn hình "My Patients" khi người dùng chọn "Patient Management"
              Get.toNamed('/myPatients');
            },
          ),
          // Thêm các ListTile khác ở đây cho các mục còn lại trong doctorTabNameList
        ],
      ),
    );
  }
}
