import 'package:get/get.dart';

class LoginController extends GetxController {
  Rx<bool> isHide = Rx<bool>(true);
  Rx<String> username = Rx<String>('');
  Rx<String> password = Rx<String>('');
  Rx<String> message = Rx<String>('');

  void usernameChanged(String? value) {
    username.value = value ?? '';
  }

  void passwordChanged(String? value) {
    password.value = value ?? '';
  }

  void toggleIsHide() {
    isHide.value = !isHide.value;
  }

  void onTapSubmit() {
    if (username.value == 'Tan' && password.value == '123') {
      message.value = 'Success';
      return;
    }
    message.value = 'Fail';
  }
}
