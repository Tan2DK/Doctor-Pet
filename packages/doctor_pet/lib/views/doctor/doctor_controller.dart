import 'package:get/get.dart';

class DoctorController extends GetxController {
  RxInt count = RxInt(0);
  void increase() => count.value++;
}
