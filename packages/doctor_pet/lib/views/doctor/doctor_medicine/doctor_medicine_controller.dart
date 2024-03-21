import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/core/data/medicine.dart';
import 'package:doctor_pet/data/data_mock/doctor_medicine.dart';
import 'package:doctor_pet/views/doctor/doctor_medicine/widgets/add_medicine_dialog.dart';

class DoctorMedicineController extends GetxController {
  Rx<List<Medicine>> medicines = Rx<List<Medicine>>([]);
  Rx<List<Map<String, dynamic>>> selectedMedicines =
      Rx<List<Map<String, dynamic>>>([]);

  @override
  void onInit() {
    super.onInit();
    fetchMedicines();
  }

  Future<void> fetchMedicines() async {
    await Future.delayed(const Duration(seconds: 1));
    medicines.value = mockMedicines;
  }

  void addSelectedMedicine(Medicine medicine, int quantity, String note) {
    List<Map<String, dynamic>> updatedList = List.from(selectedMedicines.value);
    updatedList.add({
      'medicine': medicine,
      'quantity': quantity,
      'note': note,
    });
    selectedMedicines.value = updatedList;
  }

  void clearSelectedMedicines() {
    selectedMedicines.value = [];
  }

  void showAddMedicineDialog() {
    Get.dialog(AddMedicineDialog(
        medicines: medicines, addSelectedMedicine: addSelectedMedicine));
  }
}
