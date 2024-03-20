import 'package:doctor_pet/views/schedule/schedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ScheduleView extends GetView<ScheduleController> {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: controller.onShowScheduleSlot,
          child: const Text('Register Slot'),
        ),
      ),
    );
  }
}
