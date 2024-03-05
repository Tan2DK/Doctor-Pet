import 'package:get/get.dart';

import 'q&a_controller.dart';

class QuestionAnswerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionAnswerController>(() => QuestionAnswerController());
  }
}
