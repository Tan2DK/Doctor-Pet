import '../views/doctor/Screenmain.dart';

import '../views/pet/Screenmain.dart';
import '../views/doctor/doctor_binding.dart';

import 'package:get/get.dart';

import '../views/home/home_binding.dart';
import '../views/home/home_view.dart';

import '../views/pet/pet_binding.dart';

class AppRoutes {
  AppRoutes._();

  static final mainRoutes = [
    GetPage(
      name: RoutesName.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.pet,
      page: () => const Screenmain(),
      binding: PetBinding(),
    ),
    GetPage(
      name: RoutesName.doctor,
      page: () => const Screenmaindoctor(),
      binding: DoctorBinding(),
    ),
  ];
}

class RoutesName {
  static const String home = '/home';
  static const String pet = '/pet';
  static const String doctor = '/doctor';
  static const String nestedNavDoctor = 'nested_navigation_doctor';
}
