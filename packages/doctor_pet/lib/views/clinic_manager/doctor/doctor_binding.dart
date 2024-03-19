import 'package:doctor_pet/views/clinic_manager/doctor/doctor_controller.dart';

import 'package:get/get.dart';

class DoctorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorController>(() => DoctorController());
  }
}
