import 'package:get/get.dart';
import 'package:doctor_pet/views/staff/staff_comments/staff_comments_controller.dart';

class StaffCommentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StaffCommentController>(() => StaffCommentController());
  }
}
