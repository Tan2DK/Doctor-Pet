import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_routes.dart';
import '../../doctor/doctor_binding.dart';
import '../../customer_profile/customer_profile_view.dart';
import '../../customer_profile/customer_profile_binding.dart';

class NestedNavigationCusProfile extends StatelessWidget {
  const NestedNavigationCusProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(RoutesName.customerProfile),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return GetPageRoute(
          settings: settings,
          binding: CustomerProfileBinding(),
          page: () => const ProfileView(),
        );
      },
    );
  }
}
