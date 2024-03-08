import 'package:doctor_pet/views/patient/patient_controller.dart';
import 'package:get/get.dart';

class PatientBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PatientController>(() => PatientController());
  }
}
