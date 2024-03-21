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
                      labelText: 'User Name',
                      hintText: 'Enter your user name',
                      validator: (value) => controller.validateUserName(value),
                      onSaved: (value) =>
                          controller.userName.value = value ?? ''.trim(),
                    ),
                    const SizedBox(height: 16.0),
                    CustomTextFieldWidget(
                      labelText: 'Full Name',
                      hintText: 'Enter your full name',
                      validator: (value) => controller.validateFullName(value),
                      onSaved: (value) =>
                          controller.fullName.value = value ?? ''.trim(),
                    ),
                    const SizedBox(height: 16.0),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        Obx(
                          () => CustomTextFieldWidget(
                            labelText: 'Date of Birth',
                            hintText: 'Select your date of birth',
                            validator: (value) =>
                                controller.validateBirthDate(value),
                            controller: TextEditingController(
                                text: controller.birthDate.value),
                            readOnly:
                                true, // Đặt thuộc tính này để ngăn nhập liệu từ bàn phím
                            onTap: () async {
                              controller.selectDate(context);
                              // Controller sẽ tự động cập nhật giá trị qua Obx
                            },
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 8.0),
                          child: Icon(Icons.calendar_today,
                              color: Color.fromARGB(255, 11, 8, 8)),
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
                      labelText: 'Address',
                      hintText: 'Enter your address',
                      validator: (value) => controller.validateAddress(value),
                      onSaved: (value) =>
                          controller.address.value = value ?? ''.trim(),
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
                          // Đúng chỗ này cần kiểm tra tính hợp lệ của form thông qua controller
                          controller.checkFormValidity();
                          // Sau khi kiểm tra tính hợp lệ của form, kiểm tra biến isValid
                          if (controller.isValid.isTrue) {
                            // Nếu form hợp lệ, tạo tài khoản
                            controller.createAccount();
                            // Sau khi tạo tài khoản thành công, hiển thị thông báo
                            controller.showSuccessMessage();
                            // Bạn có thể thêm logic để chuyển hướng người dùng sau khi hiển thị thông báo ở đây
                          }
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: const Color(0xFF84C7AE), // Màu nền
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(32.0), // Làm tròn góc
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32.0,
                            vertical: 12.0), // Điều chỉnh kích thước
                        textStyle: const TextStyle(
                          fontSize: 16.0, // Điều chỉnh cỡ chữ
                          fontWeight: FontWeight.bold, // Điều chỉnh độ đậm
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
