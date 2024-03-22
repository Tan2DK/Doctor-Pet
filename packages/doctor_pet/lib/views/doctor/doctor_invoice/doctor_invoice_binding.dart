import 'package:get/get.dart';

import 'package:doctor_pet/views/doctor/doctor_invoice/doctor_invoice_controller.dart';

class DoctorInvoiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorInvoiceController>(() => DoctorInvoiceController());
  }
}
