import 'package:doctor_pet/views/schedule/schedule_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/shedule_slot_widget.dart';

class ScheduleView extends GetView<ScheduleController> {
  const ScheduleView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => ScheduleSlotWidget(
          slotTime: controller.list.value,
          selectedDay: controller.selectedDay.value,
          onChangedCalendarPage: controller.onChangedCalendarPage,
          pageController: controller.pageController,
          onChangedPage: controller.onPageChange,
          setPageWidth: controller.setPageWidth,
          onChecked: controller.onChecked,
          onSubmit: controller.onSubmit,
          buildSlotTableWidget: controller.buildSlotTableWidget,
        ),
      ),
    );
  }
}
