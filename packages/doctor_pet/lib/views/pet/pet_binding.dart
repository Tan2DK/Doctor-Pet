import 'package:doctor_pet/views/pet/pet_controller.dart';
import 'package:get/get.dart';

class PetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PetController>(() => PetController());
  }
}
