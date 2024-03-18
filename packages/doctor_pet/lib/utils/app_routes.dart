import 'package:doctor_pet/views/customer_booking/customer_booking_binding.dart';
import 'package:doctor_pet/views/customer_booking/customer_booking_view.dart';
import 'package:doctor_pet/views/customer_comments/customer_comments_view.dart';
import 'package:doctor_pet/views/doctor/doctor_binding.dart';
import 'package:doctor_pet/views/doctor/doctor_view.dart';

import 'package:get/get.dart';

import '../views/customer_comments/customer_comments_binding.dart';
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
      name: RoutesName.customercomment,
      page: () => CommentView(),
      binding: CustomerCommentBinding(),
    ),
    GetPage(
      name: RoutesName.booking,
      page: () => const AppointmentView(),
      binding: CustomerBookingBinding(),
    ),
    GetPage(
      name: RoutesName.schedule,
      page: () => const ScheduleView(),
      binding: ScheduleBinding(),
    )
  ];
}

class RoutesName {
  static const String home = '/home';
  static const String doctor = '/doctor';
  static const String pet = '/pet';

  static const String customercomment = '/comment';
  static const String booking = '/booking';

  static const String schedule = '/schedule';

  static const String nestedNavDoctor = 'nested_navigation_doctor';
  static const String nestedNavPet = 'nested_navigation_pet';
}
