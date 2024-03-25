import 'dart:convert';
import 'package:doctor_pet/views/clinic_manager/doctor/widgets/edit_doctor_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../core/data/doctor.dart';
import 'widgets/delete_doctor_dialog.dart';

class ClinicDoctorController extends GetxController {
  final String apiUrl = "https://localhost:5050/api/Doctor";
  Rx<List<Doctor>> dataMockDoctor = Rx<List<Doctor>>([]);
  //Todo Load doctor List
  Future<void> fetchDoctors() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<Doctor> doctors = parseDoctors(response.body);
        dataMockDoctor.value = doctors;
      } else {
        throw Exception('Failed to load doctors');
      }
    } catch (e) {
      throw Exception('Failed to load doctors');
    }
  }

  List<Doctor> parseDoctors(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Doctor>((json) => Doctor.fromJson(json)).toList();
  }

  //Todo Update doctor
  Future<void> updateDoctor(String id, Doctor doctor) async {
    try {
      final response = await http.put(
        Uri.parse('$apiUrl/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(doctor.toJson()),
      );
      if (response.statusCode == 204) {
        fetchDoctors();
      } else {
        throw Exception('Failed to update doctor');
      }
    } catch (e) {
      throw Exception('Failed to update doctor');
    }
  }

  void showAddEditDialog(BuildContext context, {int? index}) {
    if (index != null) {
      final doctorId = dataMockDoctor.value[index].id;
      if (doctorId != null) {
        Get.dialog(EditDoctorDialog(
          addEditDoctor: (doctor, _) async {
            await updateDoctor(doctorId, doctor);
            Get.back();
            await fetchDoctors();
          },
          doctor: dataMockDoctor.value[index],
          index: index,
        ));
      }
    } else {
      Get.dialog(EditDoctorDialog(
        addEditDoctor: (doctor, _) async {
          await createDoctor(doctor);
          Get.back();
          await fetchDoctors();
        },
        doctor: null,
      ));
    }
  }

  void addEditDoctor(Doctor doctor, int? index) {
    if (doctor.name.isEmpty ||
        doctor.phone.isEmpty ||
        doctor.address.isEmpty ||
        doctor.specialized.isEmpty) {
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

  //Todo Delete doctor
  Future<void> deleteDoctorAPI(String id) async {
    try {
      final response = await http.delete(Uri.parse('$apiUrl/$id'));
      if (response.statusCode == 204) {
        fetchDoctors();
      } else {
        throw Exception('Failed to delete doctor');
      }
    } catch (e) {
      throw Exception('Failed to delete doctor');
    }
  }

  void deleteDoctor(int index) {
    if (index >= 0 && index < dataMockDoctor.value.length) {
      final doctorId = dataMockDoctor.value[index].id;
      if (doctorId != null) {
        deleteDoctorAPI(doctorId);
      }
    }
    Get.back();
  }

  void showDeleteDialog(BuildContext context, int index) {
    Get.dialog(DeleteDoctorDialog(
      index: index,
      deleteDoctor: deleteDoctor,
    ));
  }

  //Todo Create doctor
  Future<void> createDoctor(Doctor doctor) async {
    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(doctor.toJson()),
      );
      if (response.statusCode == 201) {
        fetchDoctors();
      } else {
        throw Exception('Failed to create doctor');
      }
    } catch (e) {
      throw Exception('Failed to create doctor');
    }
  }

  //Todo sort by name

  Future<void> sortDoctorByName() async {
    try {
      final response = await http.get(Uri.parse('$apiUrl/sortedByName'));
      if (response.statusCode == 200) {
        final List<Doctor> sortedDoctors = parseDoctors(response.body);
        dataMockDoctor.value = sortedDoctors;
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
    fetchDoctors();
  }
}
