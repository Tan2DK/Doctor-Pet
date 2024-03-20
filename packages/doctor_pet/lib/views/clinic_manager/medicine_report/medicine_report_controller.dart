import 'package:doctor_pet/core/data/medicine_report.dart';
import 'package:doctor_pet/data/data_mock/data_mock_medicine_report.dart';
import 'package:get/get.dart';

class MedicineReportController extends GetxController {

  Rx<List<MedicineReport>> dataMockMedicineReport = Rx<List<MedicineReport>>([]);

  @override
  void onInit() {
    super.onInit();
    dataMockMedicineReport.value = mockMedicneReport;
  }
}

