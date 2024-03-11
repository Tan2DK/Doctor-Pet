import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'register_controller.dart'; // Đảm bảo đường dẫn này đúng
import 'package:doctor_pet/common_widgets/custom_textfield_widget.dart'; // Import CustomTextFieldWidget

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/img/LoginBackground.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Container(
            width: 600,
            height: 650,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: const Color(0xFFF6FBF9),
            ),
            child: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'Create An Account',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFieldWidget(
                      labelText: 'First Name',
                      hintText: 'Enter your first name',
                      validator: (value) => controller.validateFirstName(value),
                      onSaved: (value) =>
                          controller.firstName.value = value ?? ''.trim(),
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFieldWidget(
                      labelText: 'Last Name',
                      hintText: 'Enter your last name',
                      validator: (value) => controller.validateLastName(value),
                      onSaved: (value) =>
                          controller.lastName.value = value ?? ''.trim(),
                    ),
                    const SizedBox(height: 16.0),
                    Stack(
                      children: [
                        Obx(() => CustomTextFieldWidget(
                              labelText: 'Date of Birth',
                              hintText: 'Select your date of birth',
                              controller: TextEditingController(
                                text: controller.birthDate.value.isNotEmpty
                                    ? controller.birthDate.value
                                    : '',
                              ),
                            )),
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          child: InkWell(
                            onTap: () async {
                              controller.selectDate(context);
                              // Sau khi chọn ngày, cập nhật lại giá trị trong text field
                              controller.birthDate.refresh();
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Icon(Icons.calendar_today),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFieldWidget(
                      labelText: 'Email Address',
                      hintText: 'Enter your email address',
                      validator: (value) => controller.validateEmail(value),
                      onSaved: (value) =>
                          controller.email.value = value ?? ''.trim(),
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFieldWidget(
                      labelText: 'Password',
                      hintText: 'Enter your password',
                      obscureText: true,
                      validator: (value) =>
                          controller.validatePassword(value)?.trim(),
                      onChanged: (value) =>
                          controller.password.value = value.trim(),
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFieldWidget(
                      labelText: 'Confirm Password',
                      hintText: 'Re-enter your password',
                      obscureText: true,
                      validator: (value) =>
                          controller.validateConfirmPassword(value)?.trim(),
                      onChanged: (value) =>
                          controller.confirmPassword.value = value.trim(),
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFieldWidget(
                      labelText: 'Phone',
                      hintText: 'Enter your phone number',
                      validator: (value) =>
                          controller.validatePhoneNumber(value),
                      onSaved: (value) =>
                          controller.phoneNumber.value = value ?? ''.trim(),
                    ),
                    const SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          formKey.currentState!.save();
                          controller.checkFormValidity();
                          if (controller.isValid.isTrue) {
                            controller.createAccount();
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF84C7AE),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        textStyle: const TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('Create Account'),
                    ),
                    const SizedBox(height: 16.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          onPressed: () {
                            // Logic for Back button
                          },
                          child: const Text('Back'),
                        ),
                        TextButton(
                          onPressed: () {
                            // Logic for Already have an account link
                          },
                          child: const Text('Already Have An Account?'),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
