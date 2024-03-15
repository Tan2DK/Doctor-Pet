import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:doctor_pet/core/data/booking.dart';
import 'package:table_calendar/table_calendar.dart'; // Đường dẫn này cần phải đúng với vị trí của file data của bạn

class CustomerBookingController extends GetxController {
  Rx<DateTime> selectedDate = DateTime.now().obs;
  Rx<TimeOfDay> selectedTime = TimeOfDay.now().obs;
  final Rx<CalendarFormat> calendarFormat = CalendarFormat.month.obs;
  Rx<DateTime> focusedDay = DateTime.now().obs;
  final RxList<String> doctorList = <String>[
    'Dr. John Doe',
    'Dr. Jane Smith',
    'Dr. Michael Brown',
    'Dr. Emily Johnson',
  ].obs;
  RxString selectedDoctor = ''.obs;
  RxString status = ''.obs;
  RxString displayedDoctor = ''.obs;
  RxString displayedDate = ''.obs;
  RxString displayedTime = ''.obs;

  Rx<List<Appointment>> appointments = Rx<List<Appointment>>([]);
  @override
  void onInit() {
    super.onInit();
    // Assuming `mockComments` is a pre-existing list of mock comments
    if (doctorList.isNotEmpty) {
      selectedDoctor.value = doctorList[0]; // Set the default selected doctor
    }
  }

  void updateFocusedDay(DateTime focuserd) {
    focusedDay.value = focuserd;
    focusedDay.refresh();
  }

  void updateSelectedDate(DateTime date) {
    selectedDate.value = date;
    selectedDate.refresh();
  }

  void updateSelectedTime(TimeOfDay time) {
    selectedTime.value = time;
    selectedTime.refresh();
  }

  void updateSelectedDoctor(String doctor) {
    selectedDoctor.value = doctor;
    update(); // This might not be necessary if you're just updating observable values
  }

  void scheduleAppointment(BuildContext context) {
    status.value = 'Pending Acceptance';
    displayedDoctor.value = selectedDoctor.value;
    displayedDate.value = DateFormat('yyyy-MM-dd').format(selectedDate.value);
    displayedTime.value = selectedTime.value.format(context);

    // Tiếp theo, bạn có thể hiển thị AlertDialog giống như trong _scheduleAppointment của trước
  }

  void addAppointment(Appointment appointment) {
    appointments.value.add(appointment);
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: selectedTime.value,
    );
    if (picked != null) {
      updateSelectedTime(picked);
    }
  }
}
