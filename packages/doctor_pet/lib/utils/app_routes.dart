import 'package:doctor_pet/views/LandingPage/LandingPage_binding.dart';
import 'package:doctor_pet/views/LandingPage/LandingPage_view.dart';
import 'package:doctor_pet/views/doctor/Screenmain.dart';
import 'package:doctor_pet/views/login/login.dart';
import 'package:doctor_pet/views/pet/Screenmain.dart';
import 'package:get/get.dart';

import '../views/home/home_binding.dart';
import '../views/home/home_view.dart';
import 'package:doctor_pet/views/pet/pet_view.dart';
import 'package:doctor_pet/views/pet/pet_binding.dart';
import 'package:doctor_pet/views/doctor/doctor_binding.dart';
import 'package:doctor_pet/views/doctor/doctor_view.dart';

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
    GetPage(
      name: RoutesName.landingpage,
      page: () => const LandingPageView(),
      binding: LandingPageBinding(),
    ),
  ];
}

class RoutesName {
  static const String home = '/home';
  static const String pet = '/pet';
  static const String doctor = '/doctor';
  static const String landingpage = '/landing';
}
