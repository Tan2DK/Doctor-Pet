import 'package:doctor_pet/views/clinic_manager/staff/staff_view.dart';
import 'package:doctor_pet/views/clinic_manager/medicine/clinic_medicine_view.dart';
import 'package:doctor_pet/views/doctor/doctor_binding.dart';
import 'package:doctor_pet/views/doctor/doctor_view.dart';
import 'package:doctor_pet/views/register/register_binding.dart';
import 'package:doctor_pet/views/register/register_view.dart';

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
import 'package:doctor_pet/views/pet/pet_view.dart';
import 'package:doctor_pet/views/pet/pet_binding.dart';

import '../views/schedule/schedule_binding.dart';
import '../views/schedule/schedule_view.dart';
import '../views/doctor/doctor_invoice/doctor_invoice_binding.dart';
import '../views/doctor/doctor_invoice/doctor_invoice_view.dart';

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
      name: RoutesName.schedule,
      page: () => const ScheduleView(),
      binding: ScheduleBinding(),
    ),
    GetPage(
      name: RoutesName.clinicDoctor,
      page: () => const ClinicDoctorView(),
      binding: ClinicDoctorBinding(),
    ),
    GetPage(
      name: RoutesName.invoiceReport,
      page: () => const InvoiceReportView(),
      binding: InvoiceReportBinding(),
    ),
    GetPage(
      name: RoutesName.clinicMedicine,
      page: () => const ClinicMedicineView(),
      binding: ClinicMedicineBinding(),
    ),
    GetPage(
      name: RoutesName.medicineReport,
      page: () => const MedicineReportView(),
      binding: MedicineReportBinding(),
    ),
    GetPage(
      name: RoutesName.clinicPatient,
      page: () => const PatientView(),
      binding: PatientBinding(),
    ),
    GetPage(
      name: RoutesName.clinicStaff,
      page: () => const StaffView(),
      binding: StaffBinding(),
    ),
    GetPage(
      name: RoutesName.nestedNavDoctorInvoice,
      page: () => const DoctorInvoiceView(),
      binding: DoctorInvoiceBinding(),
    ),
  ];
}

class RoutesName {
  static const String home = '/home';
  static const String doctor = '/doctor';
  static const String clinicDoctor = '/clinic-doctor';
  static const String invoiceReport = '/invoice-report';
  static const String clinicMedicine = '/clinic-medicine';
  static const String medicineReport = '/medicine-report';
  static const String clinicPatient = '/clinic-patient';
  static const String clinicStaff = '/clinic-staff';
  static const String pet = '/pet';
  static const String schedule = '/schedule';
  static const String register = '/register';
  static const String nestedNavDoctor = 'nested_navigation_doctor';
  static const String nestedNavPet = 'nested_navigation_pet';
  static const String nestedNavDoctorInvoice = '/nested_nav_doctor_invoice';
}
