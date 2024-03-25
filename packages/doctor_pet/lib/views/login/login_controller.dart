import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;

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

  void callLoginAPI(String username, String password) async {
    var url = Uri.parse('https://localhost:5001/api/User/login');
    var body = jsonEncode({'userName': username, 'password': password});

    try {
      var response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: body,
      );

      if (response.statusCode == 200) {
        Get.toNamed('/home');
      } else {
        Get.snackbar('Login Failed', 'Invalid username or password');
      }
    } catch (e) {
      Get.snackbar('Error', 'An error occurred while processing your request');
    }
  }

  void onTapSubmit() {
    if (canSubmit.value) {
      callLoginAPI(username.value, password.value);
    }
  }
}
