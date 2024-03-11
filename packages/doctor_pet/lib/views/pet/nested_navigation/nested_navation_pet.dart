import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_routes.dart';
import '../../pet/pet_binding.dart';
import '../../pet/pet_view.dart';

class NestedNavigationPet extends StatelessWidget {
  const NestedNavigationPet({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(RoutesName.nestedNavPet),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return GetPageRoute(
          settings: settings,
          binding: PetBinding(),
          page: () => const PetView(),
        );
      },
    );
  }
}
