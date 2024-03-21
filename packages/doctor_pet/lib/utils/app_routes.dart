import 'package:doctor_pet/views/clinic_manager/staff/staff_view.dart';
import 'package:doctor_pet/views/clinic_manager/medicine/clinic_medicine_view.dart';
import 'package:doctor_pet/views/doctor/doctor_binding.dart';
import 'package:doctor_pet/views/doctor/doctor_view.dart';

import 'package:get/get.dart';

import '../views/clinic_manager/doctor/clinic_doctor_binding.dart';
import '../views/clinic_manager/doctor/clinic_doctor_view.dart';
import '../views/clinic_manager/invoice_report/invoice_report_binding.dart';
import '../views/clinic_manager/invoice_report/invoice_report_view.dart';

import '../views/clinic_manager/patient/patient_binding.dart';
import '../views/clinic_manager/patient/patient_view.dart';
import '../views/clinic_manager/staff/staff_binding.dart';

import '../views/clinic_manager/medicine_report/medicine_report_binding.dart';
import '../views/clinic_manager/medicine_report/medicine_report_view.dart';
import '../views/clinic_manager/medicine/clinic_medicine_binding.dart';
import '../views/home/home_binding.dart';
import '../views/home/home_view.dart';
import '../views/register/register_view.dart';
import '../views/register/register_binding.dart';

class AppRoutes {
  AppRoutes._();

  static final mainRoutes = [
    GetPage(
      name: RoutesName.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: RoutesName.register,
      page: () => const RegisterView(),
      binding: RegisterBinding(),
    ),
  ];
}

class RoutesName {
  static const String home = '/home';
  static const String register = '/register';
}
