import 'package:doctor_pet/views/LandingPage/LandingPage_controller.dart';
import 'package:get/get.dart';

class LandingPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LandingPageController>(() => LandingPageController());
  }
}
