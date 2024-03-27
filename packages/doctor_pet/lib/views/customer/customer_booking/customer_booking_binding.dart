import 'package:get/get.dart';

import 'customer_booking_controller.dart';

class CustomerBookingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerBookingController>(() => CustomerBookingController());
  }
}
