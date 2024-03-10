import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  Rx<bool> isHide = Rx<bool>(true);
  Rx<String> email = Rx<String>('');
  Rx<String> password = Rx<String>('');
  Rxn<String> errorPasswordPassword = Rxn<String>();
  Rxn<String> errorMessageEmail = Rxn<String>();
  Rx<int> count = Rx<int>(0);

  void emailChanged(String? value) {
    email.value = value ?? '';
    errorMessageEmail.value =
        email.value.isEmail ? null : 'Email address is not valid';
  }

  void passwordChanged(String? value) {
    password.value = value ?? '';
    errorMessageEmail.value =
        password.value.length > 7 && password.value.length < 17
            ? null
            : 'Password is not valid';
  }

  void toggleIsHide() {
    isHide.value = !isHide.value;
  }

  void onTapSubmit() {
    // if (username.value == 'Tan' && password.value == '123') {
    //   errorMessageEmail.value = 'Success';
    //   return;
    // }
    // errorMessageEmail.value = 'Fail';
    Get.dialog(const AlertDialog(content: Text('afwefw')));
    // ++count.value;
  }
}
