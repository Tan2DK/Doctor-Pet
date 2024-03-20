import 'package:doctor_pet/views/clinic_manager/invoice_report/invoice_report_controller.dart';
import 'package:get/get.dart';

class InvoiceReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InvoiceReportController>(() => InvoiceReportController());
  }
}
