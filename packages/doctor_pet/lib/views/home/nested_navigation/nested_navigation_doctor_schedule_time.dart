import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_routes.dart';
import '../../doctor/doctor_scheduletime/doctor_scheduletime_binding.dart';
import '../../doctor/doctor_scheduletime/doctor_scheduletime_view.dart';

class NestedNavigationDocTime extends StatelessWidget {
  const NestedNavigationDocTime({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(RoutesName.nestedNavPet),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return GetPageRoute(
          settings: settings,
          binding: DoctorScheduletimeBinding(),
          page: () => const DoctorScheduletimeView(),
        );
      },
    );
  }
}
