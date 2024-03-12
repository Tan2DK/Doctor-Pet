import 'package:doctor_pet/common_widgets/custom_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'customer_profile_controller.dart';
// Use this for date formatting

class ProfilePage1 extends GetView<CustomerProfileController> {
  const ProfilePage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _TopPortion(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 16.0),
              child: Column(
                children: [
                  Text(
                    controller.displayName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Obx(
                        () => Expanded(
                          child: CustomTextfieldWidget(
                            lable: 'First Name',
                            hint: 'Please enter your First Name.',
                            controller: controller.firstnamecontroller,
                            errorMessage: controller.errorMessageFisName.value,
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Obx(
                        () => Expanded(
                          child: CustomTextfieldWidget(
                            lable: 'Last Name',
                            hint: 'Please enter your Last Name.',
                            controller: controller.lastnamecontroller,
                            errorMessage: controller.errorMessageLastName.value,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Obx(
                    () => CustomTextfieldWidget(
                      lable: 'Email',
                      hint: 'Please enter your Last Email.',
                      controller: TextEditingController(text: 'Kep@gmail.com'),
                      fixIcon: const Icon(Icons.email),
                      errorMessage: controller.errorMessageEmail.value,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomTextfieldWidget(
                    lable: 'Phone Number',
                    hint: 'Please enter your Phone Number.',
                    controller: TextEditingController(text: '012345678'),
                    fixIcon: const Icon(Icons.phone),
                    errorMessage: controller.errorMessagePhone.value,
                  ),
                  const SizedBox(height: 16),
                  CustomTextfieldWidget(
                    errorMessage: controller.errorMessageDob.value,
                    lable: 'Date of Birth',
                    hint: 'Please choose your Date of Birth.',
                    controller: controller.dobController,
                    fixIcon: const Icon(Icons.calendar_today),
                    icons: IconButton(
                      icon: const Icon(Icons.calendar_today_outlined),
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          controller.dobController.text =
                              DateFormat('yyyy-MM-dd').format(
                                  pickedDate); // Cập nhật giá trị của dobController
                        }
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: controller.saveChanges,
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue,
                    ),
                    child: const Text('Save Changes'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TopPortion extends StatelessWidget {
  const _TopPortion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
          colors: [Color.fromARGB(255, 202, 99, 152), Color(0xff006df1)],
        ),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: 100,
          height: 100,
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90oy1wYWgefHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80',
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
