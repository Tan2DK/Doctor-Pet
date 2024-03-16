import 'package:doctor_pet/views/clinic_manager/medicine/medicine_controller.dart';
import 'package:get/get.dart';

class MedicineBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicineController>(() => MedicineController());
  }
}
