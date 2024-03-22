import 'package:get/get.dart';

import 'package:doctor_pet/views/doctor/doctor_medicine/doctor_medicine_controller.dart';

class DoctorMedicineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorMedicineController>(() => DoctorMedicineController());
  }
}
