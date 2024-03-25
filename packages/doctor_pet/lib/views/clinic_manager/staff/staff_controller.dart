import 'dart:convert';

import 'package:doctor_pet/core/data/staff.dart';
import 'package:doctor_pet/views/clinic_manager/staff/widgets/delete_staff_dialog.dart';
import 'package:doctor_pet/views/clinic_manager/staff/widgets/edit_staff_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class StaffController extends GetxController {
  Rx<List<Staff>> dataMockStaff = Rx<List<Staff>>([]);
  final String apiUrl = "https://localhost:5001/api/Employee";

  Future<void> fetchStaff() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<Staff> employees = parseStaff(response.body);
        dataMockStaff.value = employees;
      } else {
        throw Exception('Failed to load doctors: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load doctors: $e');
    }
  }

  List<Staff> parseStaff(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Staff>((json) {
      if (json['birthdate'] is String) {
        try {
          DateTime birthdate = DateTime.parse(json['birthdate']);
          json['birthdate'] = birthdate;
        } catch (e) {
          print('Invalid birthdate format: ${json['birthdate']}');
        }
      }

      return Staff.fromJson(json);
    }).toList();
  }

  //Todo
  void showAddEditStaffDialog(BuildContext context, {int? index}) {
    Get.dialog(EditStaffDialog(
      selectDate: selectDate,
      addEditStaff: addEditStaff,
      staff: index != null ? dataMockStaff.value[index] : null,
      index: index,
    ));
  }

  void addEditStaff(Staff staff, int? index) {
    if (staff.name.isEmpty || staff.phone.isEmpty || staff.address.isEmpty) {
      return;
    }
    if (index != null) {
      dataMockStaff.value[index] = staff;
    } else {
      dataMockStaff.value.add(staff);
    }
    dataMockStaff.refresh();
    Get.back();
  }

  Future<void> deleteStaffAPI(String id) async {
    try {
      final response = await http.delete(Uri.parse('$apiUrl/$id'));
      if (response.statusCode == 204) {
        fetchStaff();
      } else {
        throw Exception('Failed to delete staff');
      }
    } catch (e) {
      throw Exception('Failed to delete staff');
    }
  }

  void deleteStaff(int index) {
    if (index >= 0 && index < dataMockStaff.value.length) {
      final staffId = dataMockStaff.value[index].staffId;
      deleteStaffAPI(staffId);
    }
    Get.back();
  }

  void showDeleteDialog(BuildContext context, int index) {
    Get.dialog(DeleteStaffDialog(
      index: index,
      deleteStaff: deleteStaff,
    ));
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

  Future<void> sortDoctorByName() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/sortedByName'));
      if (response.statusCode == 200) {
        final List<Staff> sortedDoctors = parseStaff(response.body);
        dataMockStaff.value = sortedDoctors;
      } else {
        throw Exception('Failed to sort doctors by name');
      }
    } catch (e) {
      throw Exception('Failed to sort doctors by name');
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchStaff();
  }
}
