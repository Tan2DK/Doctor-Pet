import 'package:doctor_pet/views/home/nested_navigation/nested_navigation_doctor.dart';
import 'package:doctor_pet/views/home/nested_navigation/nested_navigation_pet.dart';
import 'package:doctor_pet/views/home/nested_navigation/nested_navigation_doctor_medicine.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/views/home/nested_navigation/nested_navigation_doctor_invoice.dart';
import '../../utils/app_enum.dart';
// ignore: depend_on_referenced_packages
import 'package:jwt_decoder/jwt_decoder.dart';

class HomeController extends GetxController {
  RxInt index = RxInt(0);
  late String token;
  late String userName;
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
    'Schedule Timing',
    'Appointment Management',
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

  @override
  void onInit() {
    super.onInit();
    token = Get.arguments['accessToken'];

    decodeJwtAndSetRole();
  }

  void decodeJwtAndSetRole() {
    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    String roleString = decodedToken['UserRole'].toString();

    switch (roleString) {
      case '0':
        role.value = Role.admin;
        break;
      case '1':
        role.value = Role.clinicManager;
        break;
      case '2':
        role.value = Role.customer;
        break;
      case '3':
        role.value = Role.staff;
        break;
      default:
        role.value = Role.doctor;
        break;
    }
  }

  void changeTab(int i) => index.value = i;

  List<String> get getTabListByRole => switch (role.value) {
        Role.admin => adminTabNameList,
        Role.clinicManager => clinicTabNameList,
        Role.customer => customerTabNameList,
        Role.doctor => doctorTabNameList,
        Role.staff => staffTabNameList,
      };
  // List<String> get getTabListByRole {
  //   switch (role.value) {
  //     case Role.admin:
  //       return adminTabNameList;
  //     case Role.clinicManager:
  //       return clinicTabNameList;
  //     case Role.customer:
  //       return customerTabNameList;
  //     case Role.staff:
  //       return staffTabNameList;
  //     case Role.doctor:
  //     default:
  //       return doctorTabNameList;
  //   }
  // }

  List<Widget> listScreen() {
    if (role.value == Role.doctor) {
      // Nếu là bác sĩ và index tương ứng với 'Medicine Management', trả về NestedNavigationDoctorMedicine
      if (index.value == doctorTabNameList.indexOf('Medicine Management')) {
        return [
          const NestedNavigationDoctorMedicine(),
        ];
      }
    }
    // Nếu không phải bác sĩ hoặc index không tương ứng với 'Medicine Management', trả về NestedNavigationDoctor
    return [
      if (role.value == Role.admin) const NestedNavigationDoctor(),
      if (role.value == Role.customer) const NestedNavigationInvoice(),
    ];
  }
}
