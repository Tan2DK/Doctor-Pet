import 'package:doctor_pet/core/data/staff.dart';
import 'package:doctor_pet/data/data_mock/data_mock_staff.dart';
import 'package:doctor_pet/views/clinic_manager/staff/widgets/delete_staff_dialog.dart';
import 'package:doctor_pet/views/clinic_manager/staff/widgets/edit_staff_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffController extends GetxController {
  Rx<List<Staff>> dataMockStaff = Rx<List<Staff>>([]);

  Future<DateTime?> selectDate(
      BuildContext context, DateTime date, bool isLimit) async {
    return await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1900),
      lastDate: isLimit ? DateTime.now() : DateTime(2100),
    );
  }

  @override
  void onInit() {
    super.onInit();
    dataMockStaff.value = mockStaff;
  }

  void showAddEditStaffDialog(BuildContext context, {int? index}) {
    Get.dialog(EditStaffDialog(
      selectDate: selectDate,
      addEditStaff: addEditStaff,
      staff: index != null ? mockStaff[index] : null,
      index: index,
    ));
  }

  void addEditStaff(Staff staff, int? index) {
    if (staff.name.isEmpty || staff.phone.isEmpty || staff.address.isEmpty) {
      return;
    }
    if (staff.staffId.isEmpty) {
      dataMockStaff.value.add(staff.copyWith(
          staffId: dataMockStaff.value.length.toString()));
    } else {
      final index = dataMockStaff.value
          .indexWhere((element) => element.staffId == staff.staffId);
      dataMockStaff.value[index] = staff;
    }
    dataMockStaff.refresh();
    Get.back();
  }

  void deleteStaff(int index) {
    dataMockStaff.value.removeAt(index);
    dataMockStaff.refresh();
    Get.back();
  }

  void showDeleteDialog(BuildContext context, int index) {
    Get.dialog(DeleteStaffDialog(
      index: index,
      deleteStaff: deleteStaff,
    ));
  }
}