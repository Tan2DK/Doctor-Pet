import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_routes.dart';

import 'package:doctor_pet/views/doctor/doctor_invoice/doctor_invoice_binding.dart';
import 'package:doctor_pet/views/doctor/doctor_invoice/doctor_invoice_view.dart';

class NestedNavigationInvoice extends StatelessWidget {
  const NestedNavigationInvoice({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(RoutesName.nestedNavPet),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return GetPageRoute(
          settings: settings,
          binding: DoctorInvoiceBinding(),
          page: () => const DoctorInvoiceView(),
        );
      },
    );
  }
}
