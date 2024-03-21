import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  // Reactive variables for form fields
  var userName = RxString('');
  var fullName = RxString('');
  var birthDate = RxString('');
  var email = RxString('');
  var password = RxString('');
  var confirmPassword = RxString('');
  var phoneNumber = RxString('');
  var acceptTerms = RxBool(false);
  var isValid = RxBool(false);
  var address = RxString('');

  @override
  void onInit() {
    super.onInit();
    // Listens for changes in each field and updates the form validity accordingly
    everAll([
      userName,
      fullName,
      birthDate,
      email,
      password,
      confirmPassword,
      phoneNumber,
      acceptTerms,
      address
    ], (_) => checkFormValidity());

    // Add listeners for password and confirmPassword to validate them together
    ever(password, (_) => validateConfirmPassword(confirmPassword.value));
    ever(
        confirmPassword, (_) => validateConfirmPassword(confirmPassword.value));
  }

  String? validateUserName(String? value) => _validateName(value, 'user name');
  String? validateFullName(String? value) => _validateName(value, 'full name');
  String? validateEmail(String? value) => _validateEmail(value);
  String? validatePassword(String? value) => _validatePassword(value);
  String? validateConfirmPassword(String? value) =>
      _validateConfirmPassword(value);
  String? validatePhoneNumber(String? value) => _validatePhoneNumber(value);

  String? _validateName(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return 'Please enter your $fieldName';
    } else if (fieldName == 'user name') {
      // Đảm bảo userName không chứa ký tự đặc biệt và có độ dài từ 5 đến 20 ký tự
      if (!RegExp(r'^[a-zA-Z0-9_]{5,20}$').hasMatch(value)) {
        return 'User name must be 5-20 characters long and can only contain letters, numbers, and underscores';
      }
    } else if (fieldName == 'full name') {
      // Đảm bảo fullName có ít nhất hai từ
      if (!RegExp(r'^[a-zA-Z]+ [a-zA-Z]+').hasMatch(value)) {
        return 'Full name must contain at least two words';
      }
    }
    return null;
  }

  String? validateBirthDate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your birth date';
    }
    final DateTime? birthDate = DateTime.tryParse(value);
    if (birthDate == null) {
      return 'Invalid date format';
    }
    if (birthDate.isAfter(DateTime.now())) {
      return 'Birth date cannot be in the future';
    }
    // Thêm bất kỳ quy tắc nào khác bạn muốn áp dụng, ví dụ như tuổi tối thiểu
    return null; // Trả về null nếu không có lỗi nào được tìm thấy
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

  String? validateAddress(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your address';
    }
    return null;
  }

  bool _isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  void createAccount() {
    print('Creating account with:');
    print('User Name: ${userName.value}');
    print('Full Name: ${fullName.value}');
    print('Birth Date: ${birthDate.value}');
    print('Email: ${email.value}');
    print('Address: ${address.value}');
    print('Password: ${password.value.trim()}');
    print('Confirm Password: ${confirmPassword.value.trim()}');
    print('Phone Number: ${phoneNumber.value}');
    print('Accept Terms: ${acceptTerms.value}');
    showSuccessMessage();
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
      validateUserName(userName.value),
      validateBirthDate(birthDate.value),
      validateFullName(fullName.value),
      validateEmail(email.value),
      validatePassword(password.value),
      validateConfirmPassword(confirmPassword.value),
      validatePhoneNumber(phoneNumber.value),
      validateAddress(address.value),
      acceptTerms.value ? null : 'Terms not accepted',
    ].every((result) => result == null);
  }

  void showSuccessMessage() {
    Get.snackbar(
      'Registration Successful', // Tiêu đề thông báo
      'Your account has been created successfully!', // Nội dung thông báo
      snackPosition: SnackPosition.TOP, // Vị trí hiển thị
      backgroundColor: Colors.greenAccent,
      colorText: Colors.white,
      borderRadius: 20,
      margin: const EdgeInsets.all(15),
      snackStyle: SnackStyle.FLOATING, // Kiểu dáng thông báo
      duration: const Duration(seconds: 4), // Thời gian hiển thị
    );
  }
}
