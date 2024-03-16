import 'package:get/get.dart';
import 'package:doctor_pet/core/data/mypatients.dart';
import 'package:doctor_pet/data/data_mock/doctor_mypatients.dart';

class MyPatientsController extends GetxController {
  Rx<List<Patients>> myPatients = Rx<List<Patients>>([]);

  @override
  void onInit() {
    super.onInit();
    myPatients.value = mockMypatients;
  }
}
