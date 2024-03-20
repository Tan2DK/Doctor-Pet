import 'package:doctor_pet/views/clinic_manager/doctor/clinic_doctor_controller.dart';

import 'package:get/get.dart';

class ClinicDoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ClinicDoctorController>(() => ClinicDoctorController());
  }
}
