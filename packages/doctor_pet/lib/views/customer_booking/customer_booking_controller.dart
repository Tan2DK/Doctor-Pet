import 'package:doctor_pet/utils/app_enum.dart'; // Assume this is the path to your enums
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:doctor_pet/core/data/booking.dart'; // Assuming this is the path to your booking model
import 'package:table_calendar/table_calendar.dart';

class CustomerBookingController extends GetxController {
  // Observables
  Rx<DateTime> selectedDate = DateTime.now().obs;
  final Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  final Rx<FixedSlot> selectedSlot =
      FixedSlot.slot1.obs; // Assuming slot1 is the default value
  final RxList<String> clinicList =
      <String>['Clinic A', 'Clinic B', 'Clinic C', 'Clinic D'].obs;
  RxString selectedClinic = ''.obs;
  RxString status = ''.obs;
  RxString displayedClinic = ''.obs;
  RxString displayedDate = ''.obs;
  RxString displayedSlot = ''.obs;
  Rx<List<Appointment>> appointments = Rx<List<Appointment>>([]);

  @override
  void onInit() {
    super.onInit();
    // Initialize the selected clinic with the first item from the clinic list, if available.
    if (clinicList.isNotEmpty) {
      selectedClinic.value = clinicList.first;
    }
  }

  void updateFocusedDay(DateTime focused) {
    focusedDay.value = focused;
  }

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
    // Update the displayed date whenever a new date is selected
    displayedDate.value = DateFormat('yyyy-MM-dd').format(date);
    update(); // Ensure UI updates to reflect the new date
  }

  void updateSelectedSlot(FixedSlot slot) {
    selectedSlot.value = slot;
    // Update displayed slot to reflect the change
    displayedSlot.value = slot.name;
    update(); // Refresh UI
  }

  void updateSelectedClinic(String clinic) {
    selectedClinic.value = clinic;
    // Update the displayed clinic name for summary
    displayedClinic.value = clinic;
    update(); // Ensure UI updates to reflect the new clinic
  }

  void scheduleAppointment() {
    // This function might need to interact with a backend to actually schedule the appointment
    status.value = 'Pending Acceptance';
    // After scheduling, you might want to refresh the list of appointments or navigate the user
    update(); // Refresh UI to show the updated status
  }

  void addAppointment(Appointment appointment) {
    appointments.value.add(appointment);
    update(); // Refresh the list of appointments
  }
}
