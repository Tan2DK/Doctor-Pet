import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  Rx<String> username = Rx<String>('');
  Rx<String> name = Rx<String>('');
  Rx<String> email = Rx<String>('');
  Rx<String> password = Rx<String>('');
  Rx<String> cPassword = Rx<String>('');
  Rx<String> address = Rx<String>('');
  Rx<String> phone = Rx<String>('');
  Rx<DateTime> birthday = Rx<DateTime>(DateTime.now());
  Rxn<String> errorUsername = Rxn<String>();
  Rxn<String> errorName = Rxn<String>();
  Rxn<String> errorPassword = Rxn<String>();
  Rxn<String> errorCPassword = Rxn<String>();
  Rxn<String> errorEmail = Rxn<String>();
  Rxn<String> errorAddress = Rxn<String>();
  Rxn<String> errorPhone = Rxn<String>();
  RxBool canSubmit = RxBool(false);

  void usernameChanged(String? value) {
    username.value = value ?? '';
    if (username.value.isEmpty) {
      errorUsername.value = 'Username is not allowed to blank.';
      checkSubmission();
      return;
    }
    if (username.value.length < 6 || username.value.length > 16) {
      errorUsername.value = 'Username must be in 6 to 16 characters.';
      checkSubmission();
      return;
    }
    if (!username.value[0].isAlphabetOnly) {
      errorUsername.value = 'First character of username must be an alphabet.';
      checkSubmission();
      return;
    }
    if (username.value.contains(' ')) {
      errorUsername.value = 'Space is not allowed in Username.';
      checkSubmission();
      return;
    }
    errorUsername.value = null;
    checkSubmission();
  }

  void emailChanged(String? value) {
    email.value = value ?? '';
    if (email.value.isEmpty) {
      errorEmail.value = 'Email is not allowed to blank.';
      checkSubmission();
      return;
    }
    errorEmail.value =
        email.value.isEmail ? null : 'Email address is not valid';
    checkSubmission();
  }

  void passwordChanged(String? value) {
    password.value = value ?? '';
    cPasswordChanged(cPassword.value);
    if (password.value.isEmpty) {
      errorPassword.value = 'Password is not allowed to blank.';
      checkSubmission();
      return;
    }
    if (password.value.length < 8 || password.value.length > 16) {
      errorPassword.value = 'Password must be in 8 to 16 characters.';
      checkSubmission();
      return;
    }
    if (!password.value.contains(RegExp(r'[a-z]'))) {
      errorPassword.value =
          'Password must contain at least 1 lowercase character';
      checkSubmission();
      return;
    }
    if (!password.value.contains(RegExp(r'[A-Z]'))) {
      errorPassword.value =
          'Password must contain at least 1 Uppercase character';
      checkSubmission();
      return;
    }
    if (!password.value.contains(RegExp(r'[0-9]'))) {
      errorPassword.value = 'Password must contain at least 1 digit character';
      checkSubmission();
      return;
    }
    if (!password.value.contains(RegExp(r'[(!@#$%^&*()\-_=+{};:,<.>ー?)]'))) {
      errorPassword.value =
          'Password must contain at least 1 special character';
      checkSubmission();
      return;
    }
    errorPassword.value = null;
    checkSubmission();
  }

  void cPasswordChanged(String? value) {
    cPassword.value = value ?? '';
    if (cPassword.value.isEmpty) {
      errorCPassword.value = 'Confirm password is not allowed to blank.';
      checkSubmission();

      return;
    }
    if (password.value != cPassword.value) {
      errorCPassword.value = 'Confirm password and password must be same.';
      checkSubmission();
      return;
    }
    errorCPassword.value = null;
    checkSubmission();
  }

  void nameChanged(String? value) {
    name.value = value ?? '';
    if (name.value.isEmpty) {
      errorName.value = 'Fullname is not allowed to blank.';
      checkSubmission();

      return;
    }
    errorName.value = null;
    checkSubmission();
  }

  void addressChanged(String? value) {
    address.value = value ?? '';
    if (address.value.isEmpty) {
      errorAddress.value = 'Address is not allowed to blank.';
      checkSubmission();

      return;
    }
    errorName.value = null;
    checkSubmission();
  }

  void phoneChanged(String? value) {
    phone.value = value ?? '';
    if (phone.value.isEmpty) {
      errorPhone.value = 'Phone is not allowed to blank.';
      checkSubmission();

      return;
    }
    if (!phone.value.isPhoneNumber || phone.value.length != 10) {
      errorPhone.value = 'Phone Number is invalid.';
      checkSubmission();

      return;
    }
    errorPhone.value = null;
    checkSubmission();
  }

  void checkSubmission() {
    bool isNotEmpty = username.value.isNotEmpty &&
        name.value.isNotEmpty &&
        email.value.isNotEmpty &&
        password.value.isNotEmpty &&
        cPassword.value.isNotEmpty &&
        address.value.isNotEmpty &&
        phone.value.isNotEmpty;

    bool isValid = errorUsername.value == null &&
        errorName.value == null &&
        errorEmail.value == null &&
        errorPassword.value == null &&
        errorCPassword.value == null &&
        errorAddress.value == null &&
        errorPhone.value == null;

    canSubmit.value = isNotEmpty && isValid;
  }

  Future<void> birthdayChanged(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialDate: birthday.value,
    );
    if (picked == null) return;
    birthday.value = picked;
  }

  void onTapSubmit() {}
}
