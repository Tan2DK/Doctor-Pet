import 'package:get/get.dart';

import 'doctor_question_controller.dart';

class DoctorQuestionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DoctorQuestionController>(() => DoctorQuestionController());
  }
}
