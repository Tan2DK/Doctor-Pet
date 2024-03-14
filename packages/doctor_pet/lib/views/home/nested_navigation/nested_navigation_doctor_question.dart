import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_routes.dart';
import 'package:doctor_pet/views/doctor/doctor_question/doctor_question_binding.dart';
import 'package:doctor_pet/views/doctor/doctor_question/doctor_question_view.dart';

class NestedNavigationDocQuestion extends StatelessWidget {
  const NestedNavigationDocQuestion({super.key});

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(RoutesName.nestedNavDocQuestion),
      initialRoute: "/",
      onGenerateRoute: (settings) {
        return GetPageRoute(
          settings: settings,
          binding: DoctorQuestionBinding(),
          page: () => const DoctorQuestionView(),
        );
      },
    );
  }
}
