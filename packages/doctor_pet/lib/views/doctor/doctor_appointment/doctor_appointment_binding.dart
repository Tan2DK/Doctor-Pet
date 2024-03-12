import 'package:get/get.dart';

import 'doctor_appointment_controller.dart';

class DoctorAppointmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorAppointmentController>(
        () => DoctorAppointmentController());
  }
}
