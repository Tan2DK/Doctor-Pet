import 'package:doctor_pet/core/data/prescription.dart';
import 'package:doctor_pet/data/data_mock/data_mock_prescription.dart';
import 'package:get/get.dart';

class InvoiceReportController extends GetxController {
  Rx<List<Prescription>> dataMockPrescription = Rx<List<Prescription>>([]);

  @override
  void onInit() {
    super.onInit(); 
    dataMockPrescription.value = mockPrescription;
  }
  
}