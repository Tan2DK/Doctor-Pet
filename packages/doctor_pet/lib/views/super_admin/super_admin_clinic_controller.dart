import 'package:doctor_pet/core/data/clinic.dart';
import 'package:doctor_pet/data/data_mock/data_mock_clinic.dart';
import 'package:get/get.dart';


class SuperAdminClinicController extends GetxController {
  Rx<List<Clinic>> dataMockClinic = Rx<List<Clinic>>([]);

  @override
  void onInit() {
    super.onInit();
    dataMockClinic.value = mockClinic;
  }
}