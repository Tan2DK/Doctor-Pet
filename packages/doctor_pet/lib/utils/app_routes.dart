import 'package:doctor_pet/views/doctor/doctor_binding.dart';
import 'package:doctor_pet/views/doctor/doctor_view.dart';

import 'package:get/get.dart';

import '../views/home/home_binding.dart';
import '../views/home/home_view.dart';
import 'package:doctor_pet/views/pet/pet_view.dart';
import 'package:doctor_pet/views/pet/pet_binding.dart';
import 'package:doctor_pet/views/doctor/doctor_mypatients/doctor_mypatients_binding.dart';
import 'package:doctor_pet/views/doctor/doctor_mypatients/mypatients_view.dart';

class AppRoutes {
  AppRoutes._();

  static final mainRoutes = [
    GetPage(
      name: RoutesName.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.doctor,
      page: () => const DoctorView(),
      binding: DoctorBinding(),
    ),
    GetPage(
      name: RoutesName.pet,
      page: () => const PetView(),
      binding: PetBinding(),
    ),
    GetPage(
      name: RoutesName.myPatients,
      page: () => const MypatientsView(),
      binding: DoctorMypatientsBinding(),
    ),
  ];
}

class RoutesName {
  static const String home = '/home';
  static const String doctor = '/doctor';
  static const String pet = '/pet';
  static const myPatients = '/myPatients';
  static const String nestedNavDoctor = 'nested_navigation_doctor';
  static const String nestedNavPet = 'nested_navigation_pet';
  static const String nestedNavDocMypatients = 'nested_navigation_pet';
}
