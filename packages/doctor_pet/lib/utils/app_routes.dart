import '../views/doctor/Screenmaindoctor.dart';

import '../views/pet/Screenmain.dart';
import '../views/doctor/doctor_binding.dart';

import 'package:get/get.dart';

import '../views/home/home_binding.dart';
import '../views/home/home_view.dart';

import '../views/pet/pet_binding.dart';
import '../views/pet/pet_view.dart';
import '../views/doctor/doctor_view.dart';

class AppRoutes {
  AppRoutes._();

  static final mainRoutes = [
    GetPage(
      name: RoutesName.pet,
      page: () => const Screenmain(),
      binding: PetBinding(),
    ),
    GetPage(
      name: RoutesName.doctor,
      page: () => const ScreemainDoctor(),
      binding: DoctorBinding(),
    ),
  ];
}

class RoutesName {
  static const String pet = '/pet';
  static const String doctor = '/doctor';
  static const String nestedNavDoctor = 'nested_navigation_doctor';
}
