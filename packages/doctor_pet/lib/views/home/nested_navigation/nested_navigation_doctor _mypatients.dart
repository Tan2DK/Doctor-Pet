import 'package:doctor_pet/views/doctor/doctor_mypatients/doctor_mypatients_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_routes.dart';
import '../../doctor/doctor_mypatients/my_patients_view.dart'; // Import MyPatientsView

class NestedNavigationDocMypatients extends StatelessWidget {
  const NestedNavigationDocMypatients({Key? key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(RoutesName.nestedNavDocMypatients),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return GetPageRoute(
          settings: settings,
          binding: MyPatientsBinding(),
          page: () => const MyPatientsView(),
        );
      },
    );
  }
}
