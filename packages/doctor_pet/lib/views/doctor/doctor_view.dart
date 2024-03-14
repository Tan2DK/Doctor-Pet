import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'doctor_controller.dart';

class DoctorView extends GetView<DoctorController> {
  const DoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: Obx(() => Text(controller.count.value.toString())),
          ),
          ElevatedButton(
            onPressed: controller.increase,
            child: const Text('Increase'),
          ),
        ],
      ),
    );
  }
}
