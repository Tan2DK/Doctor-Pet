import 'package:get/get.dart';
import 'package:doctor_pet/core/data/mypatients.dart';
import 'package:doctor_pet/data/data_mock/doctor_mypatients.dart';

class DoctorMypatientsController extends GetxController {
  Rx<List<Mypatients>> myPatients = Rx<List<Mypatients>>([]);

  @override
  void onInit() {
    super.onInit();
    myPatients.value = mockMypatients;
  }
}
