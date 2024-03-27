import 'package:doctor_pet/common_widget/custom_textfield_widget.dart';
import 'package:doctor_pet/utils/app_extension.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_framework/responsive_framework.dart';
import '../../common_widget/custom_text/custom_text_widget.dart';
import '../../common_widget/form_box_widget.dart';
import '../../common_widget/img_bg_widget.dart';
import 'register_controller.dart';

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
                        lable: 'Username',
                        errorMessage: controller.errorUsername.value,
                        onChanged: controller.usernameChanged,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => CustomTextfieldWidget(
                        lable: 'Email Address',
                        errorMessage: controller.errorEmail.value,
                        onChanged: controller.emailChanged,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => CustomTextfieldWidget(
                        lable: 'Password',
                        errorMessage: controller.errorPassword.value,
                        onChanged: controller.passwordChanged,
                        isPassword: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => CustomTextfieldWidget(
                        lable: 'Confirm Password',
                        errorMessage: controller.errorCPassword.value,
                        onChanged: controller.cPasswordChanged,
                        isPassword: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => CustomTextfieldWidget(
                        lable: 'Fullname',
                        errorMessage: controller.errorName.value,
                        onChanged: controller.nameChanged,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(
                      () => CustomTextfieldWidget(
                        lable: 'Address',
                        errorMessage: controller.errorAddress.value,
                        onChanged: controller.addressChanged,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Obx(
                            () => CustomTextfieldWidget(
                              lable: 'Phone Number',
                              errorMessage: controller.errorPhone.value,
                              onChanged: controller.phoneChanged,
                              textInputFormatter: [
                                FilteringTextInputFormatter.digitsOnly
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Obx(
                            () => Container(
                              height: 56,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.black.withOpacity(0.9),
                                ),
                              ),
                              child: TextButton.icon(
                                icon: const Icon(
                                  Icons.calendar_month_outlined,
                                  color: Colors.black54,
                                ),
                                onPressed: () =>
                                    controller.birthdayChanged(context),
                                label: CustomTextWidget(
                                  text: controller.birthday.value
                                      .formatDateTime('dd-MM-yyyy'),
                                  txtColor: Colors.black,
                                ),
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                            'Register',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Already have account?'),
                        const SizedBox(width: 10),
                        InkWell(
                          onTap: Get.back,
                          child: Text(
                            'Login',
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
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
