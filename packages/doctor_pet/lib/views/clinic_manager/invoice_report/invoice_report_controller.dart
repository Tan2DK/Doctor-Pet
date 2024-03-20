import 'package:doctor_pet/core/data/invoice_report.dart';
import 'package:doctor_pet/data/data_mock/data_mock_invoice_report.dart';
import 'package:get/get.dart';

class InvoiceReportController extends GetxController {
  Rx<List<InvoiceReport>> dataMockInvoiceReport = Rx<List<InvoiceReport>>([]);

  @override
  void onInit() {
    dataMockInvoiceReport.value = mockInvoiceReport;
  }
}