import 'package:get/get.dart';

import 'doctor_scheduletime_controller.dart';

class DoctorScheduletimeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorScheduletimeController>(
        () => DoctorScheduletimeController());
  }
}
