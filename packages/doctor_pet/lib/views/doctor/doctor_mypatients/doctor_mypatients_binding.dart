import 'package:get/get.dart';

import 'doctor_mypatients_controller.dart';

class DoctorMypatientsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorMypatientsController>(() => DoctorMypatientsController());
  }
}
