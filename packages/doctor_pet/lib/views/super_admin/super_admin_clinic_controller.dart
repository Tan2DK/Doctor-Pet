import 'package:doctor_pet/core/data/clinic.dart';
import 'package:doctor_pet/data/data_mock/data_mock_clinic.dart';
import 'package:doctor_pet/views/super_admin/widgets/delete_clinic_dialog.dart';
import 'package:doctor_pet/views/super_admin/widgets/edit_clinic_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuperAdminClinicController extends GetxController {
  Rx<List<Clinic>> dataMockClinic = Rx<List<Clinic>>([]);

  @override
  void onInit() {
    super.onInit();
    dataMockClinic.value = mockClinic;
  }

  void deleteClinic(int index) {
    dataMockClinic.value.removeAt(index);
    dataMockClinic.refresh();
    Get.back();
  }

  void showDeleteDialog(BuildContext context, int index) {
    Get.dialog(DeleteClinicDialog(
      index: index,
      deleteClinic: deleteClinic,
    ));
  }

  void showAddEditDialog(BuildContext context, {int? index}) {
    Get.dialog(EditClinicDialog(
      addEditClinic: addEditClinic,
      clinic: index != null ? mockClinic[index] : null,
      index: index,
    ));
  }

  void addEditClinic(Clinic clinic, int? index) {
    if (clinic.clinicName.isEmpty ||
        clinic.address.isEmpty ||
        clinic.clinicPhoneNumber.isEmpty ||
        clinic.email.isEmpty || 
        clinic.staffId.isEmpty) {
      return;
    }
    if (clinic.clinicId.isEmpty) {
      dataMockClinic.value
          .add(clinic.copyWith(clinicId: (dataMockClinic.value.length + 1).toString()));
    } else {
      final index = dataMockClinic.value
          .indexWhere((element) => element.clinicId == clinic.clinicId);
      dataMockClinic.value[index] = clinic;
    }
    dataMockClinic.refresh();
    Get.back();
  }
}
