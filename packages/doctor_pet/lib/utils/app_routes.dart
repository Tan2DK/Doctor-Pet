import 'package:doctor_pet/views/clinic_manager/doctor/doctor_binding.dart';
import 'package:doctor_pet/views/login/login.dart';
import 'package:doctor_pet/views/clinic_manager/patient/patient_binding.dart';
import 'package:doctor_pet/views/pet/Screenmain.dart';
import 'package:doctor_pet/views/clinic_manager/medicine_report/medicinereport_binding.dart';
import 'package:get/get.dart';

import '../views/home/home_binding.dart';
import '../views/home/home_view.dart';

import 'package:doctor_pet/views/pet/pet_view.dart';
import 'package:doctor_pet/views/pet/pet_binding.dart';

import 'package:doctor_pet/views/clinic_manager/medicine/medicine_view.dart';
import 'package:doctor_pet/views/clinic_manager/medicine/medicine_binding.dart';

import 'package:doctor_pet/views/clinic_manager/doctor/doctor_view.dart';
import 'package:doctor_pet/views/clinic_manager/doctor/doctor_binding.dart';

import 'package:doctor_pet/views/clinic_manager/staff/staff_view.dart';
import 'package:doctor_pet/views/clinic_manager/staff/staff_binding.dart';

import 'package:doctor_pet/views/clinic_manager/patient/patient_view.dart';
import 'package:doctor_pet/views/clinic_manager/patient/patient_binding.dart';

import 'package:doctor_pet/views/clinic_manager/medicine_report/medicinereport_view.dart';
import 'package:doctor_pet/views/clinic_manager/medicine_report/medicinereport_binding.dart';

import 'package:doctor_pet/views/clinic_manager/invoice_report/invoice_report_view.dart';
import 'package:doctor_pet/views/clinic_manager/invoice_report/invoice_report_binding.dart';

import 'package:doctor_pet/views/clinic_manager/invoice_test/invoiceview.dart';
import 'package:doctor_pet/views/clinic_manager/invoice_test/invoiceview_binding.dart';

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
      name: RoutesName.medicine,
      page: () => const MedicineView(),
      binding: MedicineBinding(),
    ),
    GetPage(
      name: RoutesName.doctor,
      page: () => const DoctorView(),
      binding: DoctorBinding(),
    ),
    GetPage(
      name: RoutesName.staff,
      page: () => const StaffView(),
      binding: StaffBinding(),
    ),
    GetPage(
      name: RoutesName.patient,
      page: () => const PatientView(),
      binding: PatientBinding(),
    ),
    GetPage(
      name: RoutesName.medicinereport,
      page: () => const MedicineReportView(),
      binding: MedicineReportBinding(),
    ),
    GetPage(
      name: RoutesName.invoicereport,
      page: () => const InvoiceReportView(),
      binding: InvoiceReportBinding(),
    ),
    GetPage(
      name: RoutesName.invoiceview,
      page: () => const InvoiceView(),
      binding: InvoiceViewBinding(),
    ),
    
  ];
  
}

class RoutesName {
  static const String home = '/home';
  static const String pet = '/pet';
  static const String medicine = '/medicine';
  static const String doctor = '/doctor';
  static const String staff = '/staff';
  static const String patient = '/patient';
  static const String medicinereport = '/medicinereport';
  static const String invoicereport = '/invoicereport';
  static const String invoiceview = '/invoiceview';
}
