import 'package:get/get.dart';
import 'package:doctor_pet/core/data/doctor.dart';
import 'package:doctor_pet/core/data/medicine.dart';
import 'package:doctor_pet/core/data/mypatients.dart'; // Import Mypatients class
import 'package:doctor_pet/core/data/data_mock/doctor_manager.dart';
import 'package:doctor_pet/core/data/data_mock/doctor_medicine.dart';
import 'package:doctor_pet/core/data/data_mock/doctor_mypatients.dart'; // Import mockMypatients

class DoctorController extends GetxController {
  var doctors = <doctor>[].obs;
  var medicines = <medicine>[].obs;

  // Add a variable to store the list of my patients
  var myPatients = <Mypatients>[].obs;

  @override
  void onInit() {
    super.onInit();
    doctors.assignAll(mockDoctors);
    medicines.assignAll(mockMedicines);

    // Initialize the list of my patients from mock data
    myPatients.assignAll(mockMypatients);
  }

  void toggleAcceptedStatus(int index, bool newValue) {
    doctors[index].accepted = newValue;
    doctors.refresh();
  }

  // Add other methods as needed
}
