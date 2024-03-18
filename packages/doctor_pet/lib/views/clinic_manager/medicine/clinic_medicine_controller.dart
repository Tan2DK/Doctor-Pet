import 'package:doctor_pet/core/data/medicine.dart';
import 'package:doctor_pet/views/clinic_manager/medicine/widgets/delete_medicine_dialog.dart';
import 'package:doctor_pet/views/clinic_manager/medicine/widgets/edit_medicine_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/data/data_mock/data_mock_medicine.dart';

class ClinicMedicineController extends GetxController {
  Rx<List<Medicine>> dataMockMedicine = Rx<List<Medicine>>([]);

  @override
  void onInit() {
    super.onInit();
    dataMockMedicine.value = mockMedicine;
  }

  Future<DateTime?> selectDate(
      BuildContext context, DateTime date, bool isLimit) async {
    return await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1900),
      lastDate: isLimit ? DateTime.now() : DateTime(2100),
    );
  }

  void onAddEditMedicine(Medicine medicine) {
    if (medicine.nameMedicine.isEmpty ||
        medicine.companyMedicineName.isEmpty ||
        medicine.quantity.isEmpty ||
        medicine.price.isEmpty) return;
        
    if (medicine.idMedicine.isEmpty) {
      dataMockMedicine.value.add(medicine.copyWith(
          idMedicine: dataMockMedicine.value.length.toString()));
    } else {
      final index = dataMockMedicine.value
          .indexWhere((element) => element.idMedicine == medicine.idMedicine);
      dataMockMedicine.value[index] = medicine;
    }
    dataMockMedicine.refresh();
    Get.back();
  }

  void onDeleteMedicine(Medicine medicine) {
    final index = dataMockMedicine.value
        .indexWhere((element) => element.idMedicine == medicine.idMedicine);
    dataMockMedicine.value.removeAt(index);
    dataMockMedicine.refresh();
    Get.back();
  }

  void showAddEditMedicineDialog(BuildContext context, Medicine? medicine) {
    Get.dialog(EditMedicineDialog(
      selectDate: selectDate,
      medicine: medicine,
      onAddEditMedicine: onAddEditMedicine,
    ));
  }

  void showDeleteMedicineDialog(BuildContext context, Medicine medicine) {
    Get.dialog(DeleteMedicineDialog(
      onDeleteMedicine: onDeleteMedicine,
      medicine: medicine,
    ));
  }
}
