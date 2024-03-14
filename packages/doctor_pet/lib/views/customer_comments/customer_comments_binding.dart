import 'package:get/get.dart';

import 'customer_comments_controller.dart';

class CustomerCommentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CommentController>(() => CommentController());
  }
}
