import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_routes.dart';
import '../../doctor/doctor_medicine/doctor_medicine_binding.dart';
import '../../doctor/doctor_medicine/doctor_medicine_view.dart';
import '../../doctor/doctor_medicine/invoice_view.dart';

class NestedNavigationDoctorMedicine extends StatelessWidget {
  const NestedNavigationDoctorMedicine({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(RoutesName.nestedNavDoctorMedicine),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return GetPageRoute(
          settings: settings,
          binding: DoctorMedicineBinding(),
          page: () => const DoctorMedicineView(),
          // page: () => const InvoiceView(),
        );
      },
    );
  }
}
