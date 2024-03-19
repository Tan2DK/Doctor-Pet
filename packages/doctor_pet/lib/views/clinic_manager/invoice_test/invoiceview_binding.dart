import 'package:doctor_pet/views/clinic_manager/invoice_test/invoiceview_controller.dart';
import 'package:get/get.dart';

class InvoiceViewBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoiceViewController>(() => InvoiceViewController());
  }
}
