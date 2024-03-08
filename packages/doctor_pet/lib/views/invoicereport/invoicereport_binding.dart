import 'package:doctor_pet/views/invoicereport/invoicereport_controller.dart';
import 'package:get/get.dart';

class InvoiceReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoiceReportController>(() => InvoiceReportController());
  }
}
