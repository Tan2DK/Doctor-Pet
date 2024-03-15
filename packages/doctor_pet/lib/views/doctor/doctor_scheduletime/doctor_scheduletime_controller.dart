import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/common_widget/dialog_time_slot.dart';

class DoctorScheduletimeController extends GetxController {
  RxList<String> listDayOfWeek = RxList<String>([
    "SUNDAY",
    "MONDAY",
    "TUESDAY",
    "WEDNESDAY",
    "THURSDAY",
    "FRIDAY",
    "SATURDAY"
  ]);
  Rx<String> dayOfWeekSelected = Rx<String>("SUNDAY");
  var userTimeSelections = <Map<String, TimeOfDay?>>[].obs;

  void setDayOfWeekSelected(String day) {
    dayOfWeekSelected.value = day;
  }

  void addTimeSlot() {
    userTimeSelections.add({"start": null, "end": null});
  }

  void updateTimeSelection(int index, String key, TimeOfDay? newTime) {
    if (newTime != null) {
      userTimeSelections[index][key] = newTime;
      userTimeSelections.refresh();
    }
  }

  void saveTimeSlots() {}

  void showEditTimeSlotsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => DialogCustom(),
    ).then((value) {
      if (value == true) {
        saveTimeSlots();
      }
    });
  }
}
