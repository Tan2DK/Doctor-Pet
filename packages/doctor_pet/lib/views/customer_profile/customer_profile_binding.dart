import 'package:get/get.dart';

import 'customer_profile_controller.dart';

class CustomerProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerProfileController>(() => CustomerProfileController());
  }
}
