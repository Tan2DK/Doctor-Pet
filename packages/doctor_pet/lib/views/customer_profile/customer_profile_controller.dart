import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomerProfileController extends GetxController {
  final TextEditingController dobController = TextEditingController();
  final TextEditingController firstnamecontroller = TextEditingController();
  final TextEditingController lastnamecontroller = TextEditingController();
  final TextEditingController gendercontroller = TextEditingController();

  final TextEditingController addresscontroller = TextEditingController();
  final TextEditingController phonecontroller = TextEditingController();
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Rx<String> displayName = Rx<String>('');
  Rx<String> fisname = Rx<String>('');
  Rx<String> lastname = Rx<String>('');
  Rx<String> gender = Rx<String>('');
  Rx<String> address = Rx<String>('');
  Rx<String> phonenumber = Rx<String>('');
  Rxn<DateTime> dob = Rxn<DateTime>();
  Rxn<String> errorMessageAddress = Rxn<String>();
  Rxn<String> errorMessageGender = Rxn<String>();

  Rxn<String> errorMessagePhone = Rxn<String>();
  Rxn<String> errorMessageFisName = Rxn<String>();
  Rxn<String> errorMessageLastName = Rxn<String>();
  Rxn<String> errorMessageDob = Rxn<String>();

  RxBool showErrors = RxBool(false);
  final List<String> genderOptions = ['Male', 'Female'];

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
      displayName.value =
          "${firstnamecontroller.text} ${lastnamecontroller.text}";
    }
  }

  void addressChanged(String? value) {
    address.value = value ?? '';
    errorMessageAddress.value =
        address.value.isAddress ? null : 'Address is not valid';
  }

  void genderChanged(String? value) {
    gender.value = value ?? '';
    errorMessageGender.value =
        gender.value.isGender ? null : 'Address is not valid';
  }

  void phoneChanged(String? value) {
    phonenumber.value = value ?? '';
    errorMessagePhone.value =
        phonenumber.value.isPhoneNumber ? null : 'Phone number is not valid';
  }

  void fistNameChanged(String? value) {
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
    errorMessageAddress.value =
        address.value.isAddress ? null : 'Address is not valid';
    errorMessagePhone.value =
        phonenumber.value.isPhoneNumber ? null : 'Phone number is not valid';
    errorMessageGender.value =
        gender.value.isGender ? null : 'Gender is not valid';
  }

  void onTapSubmit() {
    showErrors.value = true;
    validateInputs();
    if (errorMessageFisName.value == null &&
        errorMessageLastName.value == null &&
        errorMessageAddress.value == null &&
        errorMessagePhone.value == null &&
        errorMessageGender.value == null &&
        errorMessageDob.value == null) {
      Get.back();
      saveChanges();
    }
  }

  @override
  void dispose() {
    firstnamecontroller.dispose();
    lastnamecontroller.dispose();
    addresscontroller.dispose();
    phonecontroller.dispose();
    gendercontroller.dispose();
    dobController.dispose();
    super.dispose();
  }
}
