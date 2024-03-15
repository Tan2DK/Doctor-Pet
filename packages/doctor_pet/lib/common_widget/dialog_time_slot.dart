import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/views/doctor/doctor_scheduletime/doctor_scheduletime_controller.dart';


class DialogCustom extends StatelessWidget {
  DialogCustom({Key? key}) : super(key: key);

  final DoctorScheduletimeController controller =
      Get.find<DoctorScheduletimeController>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Time Slots'),
      content: SingleChildScrollView(
        child: Obx(() => Column(
              mainAxisSize: MainAxisSize.min,
              children:
                  List.generate(controller.userTimeSelections.length, (index) {
                var selection = controller.userTimeSelections[index];
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextButton(
                        onPressed: () => selectTime(context, index, 'start'),
                        child: Text(
                          selection['start']?.format(context) ??
                              'Select Start Time',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    SizedBox(width: 8), // Khoảng cách giữa các nút
                    Expanded(
                      child: TextButton(
                        onPressed: () => selectTime(context, index, 'end'),
                        child: Text(
                          selection['end']?.format(context) ??
                              'Select End Time',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                  ],
                );
              })
                    ..add(TextButton(
                      onPressed: controller.addTimeSlot,
                      child: const Text('Add More'),
                    )),
            )),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context, 'cancel'),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            controller.saveTimeSlots();
            Navigator.pop(context, 'save');
          },
          child: const Text('Save Changes'),
        ),
      ],
    );
  }

  Future<void> selectTime(BuildContext context, int index, String key) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: controller.userTimeSelections[index][key] ?? TimeOfDay.now(),
    );
    if (newTime != null) {
      controller.updateTimeSelection(index, key, newTime);
    }
  }
}
