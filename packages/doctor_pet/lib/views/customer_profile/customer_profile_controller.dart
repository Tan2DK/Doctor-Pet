import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerProfileController extends GetxController {
  final TextEditingController dobController = TextEditingController();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  String displayName = "";
  Rx<String> fisname = Rx<String>('');
  Rx<String> lastname = Rx<String>('');
  Rx<String> email = Rx<String>('');
  Rx<String> phonenumber = Rx<String>('');
  Rxn<DateTime> dob = Rxn<DateTime>();
  Rxn<String> errorMessageEmail = Rxn<String>();
  Rxn<String> errorMessagePhone = Rxn<String>();
  Rxn<String> errorMessageFisName = Rxn<String>();
  Rxn<String> errorMessageLastName = Rxn<String>();
  Rxn<String> errorMessageDob = Rxn<String>();

  RxBool showErrors = RxBool(false);
  void saveChanges() async {
    final result = await showDialog<bool>(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: const Text('Confirm'),
        content: const Text('Are you sure you want to save changes?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onTapSubmit();
              Navigator.of(context).pop(true);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );

    if (result == true) {
      // Cập nhật dữ liệu khi nhấn nút OK
      displayName = "${firstnamecontroller.text} ${lastnamecontroller.text}";
    }
  }

  void emailChanged(String? value) {
    email.value = value ?? '';
    errorMessageEmail.value =
        email.value.isEmail ? null : 'Email address is not valid';
  }

  void phoneChanged(String? value) {
    phonenumber.value = value ?? '';
    errorMessagePhone.value =
        phonenumber.value.isPhoneNumber ? null : 'Phone number is not valid';
  }

  void fisNameChanged(String? value) {
    fisname.value = value ?? '';
    errorMessageFisName.value =
        fisname.value.isNotEmpty ? null : 'First name cannot be empty';
  }

  void lastNameChanged(String? value) {
    lastname.value = value ?? '';
    errorMessageLastName.value =
        lastname.value.isNotEmpty ? null : 'Last name cannot be empty';
  }

  void dobChanged(DateTime? value) {
    dob.value = value;
    if (value != null) {
      if (value.year >= 1950 && value.year <= 2016) {
        errorMessageDob.value = null;
      } else {
        errorMessageDob.value = 'Date of birth must be between 1950 and 2016';
      }
    } else {
      errorMessageDob.value = 'Date of birth is required';
    }
  }

  void validateInputs() {
    // Xác thực tên
    errorMessageFisName.value =
        fisname.value.isNotEmpty ? null : 'First name cannot be empty';
    // Xác thực họ
    errorMessageLastName.value =
        lastname.value.isNotEmpty ? null : 'Last name cannot be empty';
    // Xác thực email
    errorMessageEmail.value =
        email.value.isEmail ? null : 'Email address is not valid';
    // Xác thực số điện thoại
    errorMessagePhone.value =
        phonenumber.value.isPhoneNumber ? null : 'Phone number is not valid';
    // Xác thực ngày sinh, ví dụ không xác thực cụ thể ở đây
    // Gọi thêm xác thực cho các trường khác tương tự
  }

  void onTapSubmit() {
    showErrors.value = true;
    validateInputs();
    Get.dialog(const AlertDialog(content: Text('afwefw')));
  }

  @override
  void dispose() {
    // Giải phóng tài nguyên khi không cần thiết nữa
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    dobController.dispose();
    super.dispose();
  }
}
