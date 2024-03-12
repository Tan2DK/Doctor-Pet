import 'package:doctor_pet/common_widgets/custom_textfield_widget.dart';
import 'package:doctor_pet/views/register/widgets/form_box_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'register_controller.dart';
import 'widgets/img_bg_widget.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({super.key});

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
                      'Create an account',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      // Need move to constant string
                      'Create an account to enjoy all the services our clinic has to offer for you and your pet',
                    ).paddingSymmetric(horizontal: 10),
                    const SizedBox(height: 10),
                    Obx(
                      () => CustomTextfieldWidget(
                        lable: 'Email Address',
                        errorMessage: controller.errorMessageEmail.value,
                        onChanged: controller.emailChanged,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const CustomTextfieldWidget(
                      lable: 'Password',
                    ),
                    const SizedBox(height: 10),
                    const CustomTextfieldWidget(
                      lable: 'Name',
                    ),
                    const SizedBox(height: 10),
                    const CustomTextfieldWidget(
                      lable: 'Phone',
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 56,
                      width: 200,
                      child: ElevatedButton(
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
                        onPressed: controller.onTapSubmit,
                        child: const Text(
                          'Register',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),
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
