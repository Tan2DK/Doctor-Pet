import 'package:get/get.dart';
import 'package:doctor_pet/core/data/doctor.dart';
import 'package:doctor_pet/data/data_mock/doctor_manager.dart';

class DoctorAppointmentController extends GetxController {
  Rx<List<doctor>> doctors = Rx<List<doctor>>([]);

  @override
  void onInit() {
    super.onInit();
    doctors.value = mockDoctors;
  }

  void toggleAcceptedStatus(int index, bool newValue) {
    if (index >= 0 && index < doctors.value.length) {
      doctors.value[index].accepted = newValue;
      doctors.refresh();
    } else {
      print("Index out of bounds: $index");
    }
  }
}
