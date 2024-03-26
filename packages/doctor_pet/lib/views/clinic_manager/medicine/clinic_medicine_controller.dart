import 'package:doctor_pet/common_widget/custom_text/custom_text_widget.dart';
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
        medicine.medicineUnit.isEmpty ||
        medicine.inventory.isEmpty ||
        medicine.price.isEmpty ||
        medicine.specifications.isEmpty ||
        medicine.medicineCateId.isEmpty) return;
    if (medicine.idMedicine.isEmpty) {
      dataMockMedicine.value.add(medicine.copyWith(
          idMedicine: (dataMockMedicine.value.length + 1).toString()));
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
    Get.snackbar('Delete Medicine', 'You deleted medicine successfully',
        titleText: const CustomTextWidget(
          text: 'Delete Medicine',
          fontWeight: FontWeight.bold,
        ));
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
