import 'package:doctor_pet/views/home/home_controller.dart';
import 'package:get/get.dart';

import '../doctor/doctor_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DoctorController>(() => DoctorController());
  }
}
