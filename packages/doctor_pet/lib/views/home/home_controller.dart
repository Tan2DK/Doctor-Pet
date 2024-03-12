import 'package:doctor_pet/views/home/nested_navigation/nested_navigation_doctor.dart';
import 'package:doctor_pet/views/home/nested_navigation/nested_navigation_pet.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../utils/app_enum.dart';

class HomeController extends GetxController {
  RxInt index = RxInt(0);
  Rx<Role> role = Rx<Role>(Role.doctor);

  final adminTabNameList = [
    'Clinic Management',
    'Doctor Management',
    'Staff Management',
    'Customer Management',
    'Report',
  ];
  final clinicTabNameList = [
    'Doctor Management',
    'Staff Management',
    'Medicine Management',
    'Patient Management',
    'Report',
  ];
  final doctorTabNameList = [
    'Appointment Management',
    'Schedule Timing',
    'Available Timing',
    'Patient Management',
    'Answer question',
    'Medicine Management',
  ];
  final staffTabNameList = [
    'Schedule Timing',
    'Question Management',
  ];
  final customerTabNameList = [
    'ViewPet',
    'Dashboard',
    'Appointment',
    'Medical history',
    'Ask Doctor',
    'Search Clinic',
  ];
  void changeTab(int i) => index.value = i;

  List<String> get getTabListByRole => switch (role.value) {
        Role.admin => adminTabNameList,
        Role.clinicManager => clinicTabNameList,
        Role.customer => customerTabNameList,
        Role.doctor => doctorTabNameList,
        Role.staff => staffTabNameList,
      };

  List<Widget> listScreen() {
    return [
      const NestedNavigationDoctor(),
    ];
  }
}
