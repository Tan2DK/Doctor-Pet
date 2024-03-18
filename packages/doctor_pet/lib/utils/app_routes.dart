import 'package:doctor_pet/views/doctor/doctor_binding.dart';
import 'package:doctor_pet/views/doctor/doctor_view.dart';

import 'package:get/get.dart';

import '../views/customer_profile/customer_profile_binding.dart';
import '../views/customer_profile/customer_profile_view.dart';
import '../views/home/home_binding.dart';
import '../views/home/home_view.dart';
import 'package:doctor_pet/views/pet/pet_view.dart';
import 'package:doctor_pet/views/pet/pet_binding.dart';

import '../views/schedule/schedule_binding.dart';
import '../views/schedule/schedule_view.dart';

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
      name: RoutesName.customerProfile,
      page: () => const ProfileView(),
      binding: CustomerProfileBinding(),
    ),
    GetPage(
      name: RoutesName.schedule,
      page: () => const ScheduleView(),
      binding: ScheduleBinding(),
    ),
  ];
}

class RoutesName {
  static const String home = '/home';
  static const String doctor = '/doctor';
  static const String pet = '/pet';
  static const String schedule = '/schedule';
  static const String nestedNavDoctor = 'nested_navigation_doctor';
  static const String nestedNavPet = 'nested_navigation_pet';
  static const String customerProfile = '/profile';
}
