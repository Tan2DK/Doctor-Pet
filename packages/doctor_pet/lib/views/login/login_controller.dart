import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<String> username = Rx<String>('');
  Rx<String> password = Rx<String>('');
  RxBool canSubmit = RxBool(false);

  void usernameChanged(String? value) {
    username.value = value ?? '';
    checkSubmission();
  }

  void passwordChanged(String? value) {
    password.value = value ?? '';
    checkSubmission();
  }

  void checkSubmission() {
    canSubmit.value = username.value.isNotEmpty && password.value.isNotEmpty;
  }

  void onTapSubmit() {}
}
