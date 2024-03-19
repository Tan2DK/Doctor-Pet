import 'package:doctor_pet/core/data/medicinereport.dart';
import 'package:doctor_pet/data/datamock/data_mock_medicinereport.dart';
import 'package:get/get.dart';

class MedicineReportController extends GetxController {

  Rx<List<medicinereport>> dataMockMedicineReport = Rx<List<medicinereport>>([]);

  @override
  void onInit() {
    dataMockMedicineReport.value = mockMedicneReport;
  }
}

