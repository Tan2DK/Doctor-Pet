import 'package:doctor_pet/utils/app_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:doctor_pet/core/data/booking.dart'; // Asumsi ini adalah path ke model data Anda
import 'package:table_calendar/table_calendar.dart';

class CustomerBookingController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  // Thời gian mặc định
  final Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;

  final Rx<FixedSlot> selectedSlot =
      FixedSlot.slot1.obs; // Giả sử slot1 là giá trị mặc định
  final RxList<String> clinicList = <String>[
    'Clinic A',
    'Clinic B',
    'Clinic C',
    'Clinic D',
  ].obs;
  RxString selectedClinic = ''.obs;
  RxString status = ''.obs;
  RxString displayedClinic = ''.obs; // Thay đổi từ displayedDoctor
  RxString displayedDate = ''.obs;
  RxString displayedSlot = ''.obs;
  Rx<List<Appointment>> appointments = Rx<List<Appointment>>([]);

  @override
  void onInit() {
    super.onInit();
    if (clinicList.isNotEmpty) {
      selectedClinic.value = clinicList.first;
    }
  }

  void updateFocusedDay(DateTime focused) {
    focusedDay.value = focused;
  }

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
  }

  void updateSelectedSlot(FixedSlot slot) {
    selectedSlot.value = slot;
    update();
  }

  void updateSelectedClinic(String clinic) {
    // Đổi tên từ updateSelectedDoctor
    selectedClinic.value = clinic;
    update(); // Update UI
  }

  void scheduleAppointment(BuildContext context) {
    status.value = 'Pending Acceptance';
    displayedClinic.value = selectedClinic.value;
    displayedDate.value = DateFormat('yyyy-MM-dd').format(selectedDate.value);
    // Correct way to get the string value of the enum
    displayedSlot.value = selectedSlot.value.name;
    // Update the UI to reflect the changes
    update();
  }

  void addAppointment(Appointment appointment) {
    appointments.value.add(appointment);
  }
}
