import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_routes.dart';
import '../../doctor/doctor_binding.dart';
import '../../doctor/doctor_view.dart';
import '../../doctor/doctor_appointment/doctor_appointment_binding.dart';
import '../../doctor/doctor_appointment/doctor_appointment_view.dart';

class NestedNavigationDoctor extends StatelessWidget {
  const NestedNavigationDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(RoutesName.nestedNavDoctor),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return GetPageRoute(
          settings: settings,
          binding: DoctorAppointmentBinding(),
          page: () => const DoctorAppointmentView(),
        );
      },
    );
  }
}
