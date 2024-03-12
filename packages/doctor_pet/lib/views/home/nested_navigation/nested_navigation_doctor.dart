import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_routes.dart';
import '../../doctor/doctor_binding.dart';
import '../../doctor/doctor_view.dart';
import '../../doctor/doctor_mypatients/mypatients_view.dart'; // Import MyPatientsView

class NestedNavigationDoctor extends StatelessWidget {
  const NestedNavigationDoctor({Key? key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(RoutesName.nestedNavDoctor),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return GetPageRoute(
          settings: settings,
          binding: DoctorBinding(),
          page: () {
            // Thêm xử lý để điều hướng tới các màn hình tương ứng
            switch (settings.name) {
              case '/':
                return const DoctorView();
              case '/myPatients':
                return const MypatientsView(); // Điều hướng tới MyPatientsView
              default:
                throw Exception('Unknown route: ${settings.name}');
            }
          },
        );
      },
    );
  }
}
