import 'package:get/get.dart';

import 'customer_viewpet_controller.dart';

class PetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PetController>(() => PetController());
  }
}
