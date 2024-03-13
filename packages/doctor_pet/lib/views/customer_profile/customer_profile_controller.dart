import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerProfileController extends GetxController {
  final TextEditingController dobController = TextEditingController();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
    final result = await Get.dialog<bool>(
      AlertDialog(
        title: const Text('Confirm'),
        content: const Text('Are you sure you want to save changes?'),
        actions: <Widget>[
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              onTapSubmit();
              Get.back(result: true);
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );

    if (result == true) {
      // Update data when OK button is pressed
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
    errorMessageFisName.value =
        fisname.value.isNotEmpty ? null : 'First name cannot be empty';
    errorMessageLastName.value =
        lastname.value.isNotEmpty ? null : 'Last name cannot be empty';
    errorMessageEmail.value =
        email.value.isEmail ? null : 'Email address is not valid';
    errorMessagePhone.value =
        phonenumber.value.isPhoneNumber ? null : 'Phone number is not valid';
  }

  void onTapSubmit() {
    showErrors.value = true;
    validateInputs();
    if (errorMessageFisName.value == null &&
        errorMessageLastName.value == null &&
        errorMessageEmail.value == null &&
        errorMessagePhone.value == null &&
        errorMessageDob.value == null) {
      Get.back();
      saveChanges();
    }
  }

  @override
  void dispose() {
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    dobController.dispose();
    super.dispose();
  }
}
