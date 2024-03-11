import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // Reactive variables for form fields
  var firstName = RxString('');
  var lastName = RxString('');
  var birthDate = RxString('');
  var email = RxString('');
  var password = RxString('');
  var confirmPassword = RxString('');
  var phoneNumber = RxString('');
  var acceptTerms = RxBool(false);
  var isValid = RxBool(false);

  @override
  void onInit() {
    super.onInit();
    // Listens for changes in each field and updates the form validity accordingly
    everAll([
      firstName,
      lastName,
      birthDate,
      email,
      password,
      confirmPassword,
      phoneNumber,
      acceptTerms
    ], (_) => checkFormValidity());

    // Add listeners for password and confirmPassword to validate them together
    ever(password, (_) => validateConfirmPassword(confirmPassword.value));
    ever(
        confirmPassword, (_) => validateConfirmPassword(confirmPassword.value));
  }

  String? validateFirstName(String? value) =>
      _validateName(value, 'first name');
  String? validateLastName(String? value) => _validateName(value, 'last name');
  String? validateEmail(String? value) => _validateEmail(value);
  String? validatePassword(String? value) => _validatePassword(value);
  String? validateConfirmPassword(String? value) =>
      _validateConfirmPassword(value);
  String? validatePhoneNumber(String? value) => _validatePhoneNumber(value);

  String? _validateName(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $fieldName';
    }
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    } else if (!_isValidEmail(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter confirm password';
    } else if (value!.trim() != password.value.trim()) {
      return 'Passwords do not match';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    return null;
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void createAccount() {
    print('Creating account with:');
    print('First Name: ${firstName.value}');
    print('Last Name: ${lastName.value}');
    print('Birth Date: ${birthDate.value}');
    print('Email: ${email.value}');
    print('Password: ${password.value.trim()}');
    print('Confirm Password: ${confirmPassword.value.trim()}');
    print('Phone Number: ${phoneNumber.value}');
    print('Accept Terms: ${acceptTerms.value}');
  }

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      birthDate.value =
          picked.toString().substring(0, 10); // Saves the selected date
    }
  }

  void checkFormValidity() {
    isValid.value = [
      validateFirstName(firstName.value),
      validateLastName(lastName.value),
      validateEmail(email.value),
      validatePassword(password.value),
      validateConfirmPassword(confirmPassword.value),
      validatePhoneNumber(phoneNumber.value),
      acceptTerms.value ? null : 'Terms not accepted',
    ].every((result) => result == null);
  }
}
