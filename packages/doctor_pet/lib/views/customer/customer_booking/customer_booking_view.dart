import 'package:doctor_pet/core/data/argument/customer_booking_argument.dart';
import 'package:doctor_pet/core/data/task_model.dart';
import 'package:doctor_pet/views/customer/customer_booking/widgets/branch_list_widget.dart';
import 'package:doctor_pet/views/schedule/schedule_controller.dart';
import 'package:doctor_pet/views/schedule/schedule_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'customer_booking_controller.dart';
import 'widgets/custom_steps_progress_bar_widget.dart';

class CustomerBookingView extends GetView<CustomerBookingController> {
  const CustomerBookingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          SizedBox(
            width: 300,
            child: Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Branches near you',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 10),
                  Expanded(
                    child: BranchListWidget(
                      branchList: controller.branchList.value,
                      selectedBranch: controller.selectedBranch.value,
                      onChanged: controller.onChanged,
                    ).paddingSymmetric(horizontal: 9),
                  ),
                ],
              ),
            ),
          ),
          const VerticalDivider(width: 0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Booking Processing',
                  style: Theme.of(context).textTheme.titleLarge,
                ).paddingSymmetric(horizontal: 10, vertical: 12),
                SizedBox(
                  child: Obx(
                    () => CustomStepsProgressBarWidget(
                      taskSize: 70,
                      indexOfInProgress: controller.completeStepBooking.value,
                      lineLength: 80,
                      taskList: TaskListModel.taskData,
                    ),
                  ),
                ).paddingSymmetric(horizontal: 10, vertical: 12),
                const Divider(),
                Expanded(
                  child: GetBuilder(
                    builder: (controller) => const ScheduleView(),
                    init: ScheduleController(
                      argument: CustomerBookingArgument(
                        onSelectedSlot: controller.onSelectedSlot,
                        availableSlots: controller.doctorSlot.value,
                      ),
                    ),
                  ).paddingSymmetric(horizontal: 8),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Obx(
                    () => FilledButton(
                      onPressed: controller.completeStepBooking < 1 ||
                              controller.selectedSlot.value == null
                          ? null
                          : controller.onSubmit,
                      style: FilledButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                        ),
                        minimumSize: const Size(120, 56),
                      ),
                      child: const Text('Submit'),
                    ).paddingSymmetric(horizontal: 24, vertical: 24),
                  ),
                ),
              ],
            ),
          ),
          // Expanded(
          //   child: GetBuilder(
          //     builder: (controller) => const MapView(),
          //     init: MapController(),
          //   ),
          // ),
        ],
      ),
    );
  }
}
