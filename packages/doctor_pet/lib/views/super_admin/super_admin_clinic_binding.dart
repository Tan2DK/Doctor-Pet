import 'package:doctor_pet/views/super_admin/super_admin_clinic_controller.dart';
import 'package:get/get.dart';

class SuperAdminClinicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SuperAdminClinicController>(() => SuperAdminClinicController());
  }
}
