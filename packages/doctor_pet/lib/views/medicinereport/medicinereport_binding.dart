import 'package:doctor_pet/views/medicinereport/medicinereport_controller.dart';
import 'package:get/get.dart';

class MedicineReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MedicineReportController>(() => MedicineReportController());
  }
}
