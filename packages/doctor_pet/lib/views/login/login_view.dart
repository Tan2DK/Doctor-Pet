// main.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  // bool isShow = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/img/LoginBackground.jpg',
          ), // Sửa đường dẫn đến ảnh nền
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Align(
          alignment: Alignment.centerRight, // Đặt ô đăng ký sang phải
          child: Container(
            width: 400,
            height: 500,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(13),
              color: Colors.grey[200],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Login An Account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Come in to enjoy our clinic\'s services, you love pets - so do we!!',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 16.0),
                TextFormField(
                  onChanged: controller.usernameChanged,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: 'Email Address',
                  ),
                ),
                const SizedBox(height: 16.0),
                Obx(
                  () => TextFormField(
                    onChanged: controller.passwordChanged,
                    decoration: InputDecoration(
                      suffixIcon: InkWell(
                        onTap: controller.toggleIsHide,
                        child: Icon(
                          controller.isHide.value
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Password',
                    ),
                    obscureText: controller.isHide.value,
                  ),
                ),
                const SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: controller.onTapSubmit,
                  child: const Text('Login'),
                ),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Handle forgot password button press
                      },
                      child: const Text('Forgot Password'),
                    ),
                    Row(
                      children: [
                        const Text('New to us?'),
                        TextButton(
                          onPressed: () {
                            // Handle sign-up button press
                          },
                          child: const Text('Sign Up'),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
