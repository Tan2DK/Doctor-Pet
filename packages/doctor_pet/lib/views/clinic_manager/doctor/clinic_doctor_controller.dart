import 'package:doctor_pet/data/data_mock/data_mock_doctor.dart';
import 'package:doctor_pet/views/clinic_manager/doctor/widgets/edit_doctor_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../core/data/doctor.dart';
import 'widgets/delete_doctor_dialog.dart';

class ClinicDoctorController extends GetxController {
  Rx<List<Doctor>> dataMockDoctor = Rx<List<Doctor>>([]);

  @override
  void onInit() {
    super.onInit();
    dataMockDoctor.value = mockDoctor;
  }

  void showAddEditDialog(BuildContext context, {int? index}) {
    Get.dialog(EditDoctorDialog(
      addEditDoctor: addEditDoctor,
      doctor: index != null ? mockDoctor[index] : null,
      index: index,
    ));
  }

  void addEditDoctor(Doctor doctor, int? index) {
    if (doctor.name.isEmpty ||
        doctor.phone.isEmpty ||
        doctor.address.isEmpty ||
        doctor.description.isEmpty) {
      return;
    }
    if (index != null) {
      dataMockDoctor.value[index] = doctor;
    } else {
      dataMockDoctor.value.add(doctor);
    }
    dataMockDoctor.refresh();
    Get.back();
  }

  void deleteDoctor(int index) {
    dataMockDoctor.value.removeAt(index);
    dataMockDoctor.refresh();
    Get.back();
  }

  void showDeleteDialog(BuildContext context, int index) {
    Get.dialog(DeleteDoctorDialog(
      index: index,
      deleteDoctor: deleteDoctor,
    ));
  }
}