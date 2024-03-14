import 'package:doctor_pet/core/data/invoicereport.dart';
import 'package:doctor_pet/data/datamock/data_mock_invoicereport.dart';
import 'package:get/get.dart';

class InvoiceReportController extends GetxController {
  Rx<List<invoicereport>> dataMockInvoiceReport = Rx<List<invoicereport>>([]);

  @override
  void onInit() {
    dataMockInvoiceReport.value = mockInvoiceReport;
  }
}