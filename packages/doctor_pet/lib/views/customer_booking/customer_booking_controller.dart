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
  final List<String> doctorList = [
    'Dr. John Doe',
    'Dr. Jane Smith',
    'Dr. Michael Brown',
    'Dr. Emily Johnson',
  ];
  var selectedDoctor = 'All Doctors'.obs; // Initialize as an empty string
  RxString status = ''.obs;
  RxString displayedDoctor = ''.obs;
  RxString displayedDate = ''.obs;
  RxString displayedTime = ''.obs;

  Rx<List<Appointment>> appointments = Rx<List<Appointment>>([]);
  @override
  void onInit() {
    super.onInit();
    // Giả sử `mockComments` là danh sách các comment mô phỏng đã được tạo sẵn
    // ignore: invalid_use_of_protected_member
    selectedDoctor.value =
        doctorList[0]; // Gán giá trị string, không phải RxString
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
    update();
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

  Future<void> selectTime(
      BuildContext context, CustomerBookingController controller) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: controller.selectedTime.value,
    );
    if (picked != null) {
      controller.updateSelectedTime(picked);
    }
  }
}
