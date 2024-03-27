import 'package:doctor_pet/common_widget/custom_textfield_widget.dart';
import 'package:doctor_pet/utils/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../common_widget/form_box_widget.dart';
import 'login_controller.dart';
import '../../common_widget/img_bg_widget.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const ImgBgWidget(),
          Align(
            alignment: Alignment(
              ResponsiveBreakpoints.of(context).screenWidth > 800 ? 0.75 : 0,
              0,
            ),
            child: FormBoxWidget(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      // Need move to constant string
                      'Come in to enjoy all the services our clinic has to offer for you and your pet',
                    ).paddingSymmetric(horizontal: 10),
                    const SizedBox(height: 10),
                    CustomTextfieldWidget(
                      lable: 'Username',
                      onChanged: controller.usernameChanged,
                    ),
                    const SizedBox(height: 10),
                    CustomTextfieldWidget(
                      lable: 'Password',
                      onChanged: controller.passwordChanged,
                      isPassword: true,
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 56,
                      width: 200,
                      child: Obx(
                        () => ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            disabledBackgroundColor:
                                const Color(0xFF84C7AE).withOpacity(.7),
                            foregroundColor: Colors.white,
                            disabledForegroundColor: Colors.white,
                            backgroundColor: const Color(0xFF84C7AE),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                          onPressed: controller.canSubmit.value
                              ? controller.onTapSubmit
                              : null,
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Text(
                            'Forgot Password',
                            style: TextStyle(
                                color: Theme.of(context).primaryColor),
                          ),
                        ),
                        Row(
                          children: [
                            const Text('Don\'t have account?'),
                            const SizedBox(width: 10),
                            InkWell(
                              onTap: () => Get.toNamed(RoutesName.register),
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ).paddingSymmetric(
                horizontal: ResponsiveBreakpoints.of(context).screenWidth <= 800
                    ? 32
                    : 0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
