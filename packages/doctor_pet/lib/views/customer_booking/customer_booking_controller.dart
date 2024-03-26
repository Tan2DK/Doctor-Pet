import 'package:doctor_pet/utils/app_enum.dart'; // Path to your enums
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:doctor_pet/core/data/booking.dart'; // Path to your booking model
import 'package:table_calendar/table_calendar.dart';

class CustomerBookingController extends GetxController {
  // Observables for date and calendar format
  Rx<DateTime> selectedDate = DateTime.now().obs;
  final Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;

  // Observable for selected slot
  final Rx<FixedSlot> selectedSlot =
      FixedSlot.slot1.obs; // Assuming slot1 is the default

  // Observable lists for clinics, doctors, and pets
  final RxList<String> clinicList =
      <String>['Clinic A', 'Clinic B', 'Clinic C', 'Clinic D'].obs;
  final RxList<String> doctorList =
      <String>['Doctor X', 'Doctor Y', 'Doctor Z'].obs;
  final RxList<String> petList = <String>['Pet A', 'Pet B', 'Pet C'].obs;
  RxString appointmentReason = ''.obs;

  // Observables for selected clinic, doctor, and pet
  RxString selectedClinic = ''.obs;
  RxString selectedDoctor = ''.obs;
  RxString selectedPet = ''.obs;

  // Observables for displaying selected options
  RxString status = ''.obs;
  RxString displayedClinic = ''.obs;
  RxString displayedDate = ''.obs;
  RxString displayedSlot = ''.obs;
  RxString displayedDoctor = ''.obs;
  RxString displayedPet = ''.obs;

  // Observable list for appointments
  Rx<List<Appointment>> appointments = Rx<List<Appointment>>([]);

  @override
  void onInit() {
    super.onInit();
    // Initialize selected options with the first item from their lists, if available
    if (clinicList.isNotEmpty) selectedClinic.value = clinicList.first;
    if (doctorList.isNotEmpty) selectedDoctor.value = doctorList.first;
    if (petList.isNotEmpty) selectedPet.value = petList.first;

    // Initialize displayed options
    updateDisplayedOptions();
  }

  void updateFocusedDay(DateTime focused) {
    focusedDay.value = focused;
  }

  void updateAppointmentReason(String reason) {
    appointmentReason.value = reason;
    update(); // This will update any UI bound to the appointmentReason observable
  }

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
    updateDisplayedDate();
    update(); // Ensure UI updates to reflect the new date
  }

  void updateSelectedSlot(FixedSlot slot) {
    selectedSlot.value = slot;
    displayedSlot.value = slot.name;
    update(); // Refresh UI
  }

  void updateSelectedClinic(String clinic) {
    selectedClinic.value = clinic;
    displayedClinic.value = clinic;
    update(); // Refresh UI
  }

  void updateSelectedDoctor(String doctor) {
    selectedDoctor.value = doctor;
    displayedDoctor.value = doctor;
    update(); // Refresh UI
  }

  void updateSelectedPet(String pet) {
    selectedPet.value = pet;
    displayedPet.value = pet;
    update(); // Refresh UI
  }

  void scheduleAppointment(BuildContext context) {
    status.value = 'Pending Acceptance';
    // Additional logic for scheduling the appointment, potentially involving backend communication
    update(); // Refresh UI to show the updated status
  }

  void addAppointment(Appointment appointment) {
    appointments.value.add(appointment);
    update(); // Refresh the list of appointments
  }

  // Helper method to update displayed options based on selections
  void updateDisplayedOptions() {
    displayedDate.value = DateFormat('yyyy-MM-dd').format(selectedDate.value);
    displayedClinic.value = selectedClinic.value;
    displayedDoctor.value = selectedDoctor.value;
    displayedPet.value = selectedPet.value;
    displayedSlot.value = selectedSlot.value.name;
  }

  // Helper method to specifically update the displayed date
  void updateDisplayedDate() {
    displayedDate.value = DateFormat('yyyy-MM-dd').format(selectedDate.value);
  }
}
