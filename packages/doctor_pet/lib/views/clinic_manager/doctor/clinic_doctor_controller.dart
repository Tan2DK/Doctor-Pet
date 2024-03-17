import 'package:doctor_pet/common_widget/custom_text/custom_text_widget.dart';

import 'package:doctor_pet/data/data_mock/data_mock_doctor.dart';
import 'package:doctor_pet/views/clinic_manager/doctor/widgets/edit_doctor_dialog.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../core/data/doctor.dart';

class ClinicDoctorController extends GetxController {
  Rx<List<Doctor>> dataMockDoctor = Rx<List<Doctor>>([]);

  Rx<bool> status = Rx<bool>(false);

  final textControllerName = TextEditingController();
  final textControllerAddress = TextEditingController();
  final textControllerPhone = TextEditingController();
  final textControllerDescription = TextEditingController();

  void onChangedName(String? value) {
    // textControllerName.text = value ?? '';
  }

  void onChangedAddress(String? value) {
    // textControllerAddress.text = value ?? '';
  }

  void onChangedPhone(String? value) {
    // textControllerPhone.text = value ?? '';
  }

  void onChangedStatus(bool? value) {
    status.value = value == true ? true : false;
  }

  void onChangedDescription(String? value) {
    // textControllerDescription.text = value ?? '';
  }

  void clearData() {
    textControllerName.clear();
    textControllerAddress.clear();
    textControllerPhone.clear();
    status.value = false;
    textControllerDescription.clear();
  }

  @override
  void onInit() {
    super.onInit();
    dataMockDoctor.value = mockDoctor;
  }

  void showAddDialog(BuildContext context) {
    // Get.dialog(AlertDialog(
    //   title: const CustomTextWidget(
    //     text: 'Add Doctor',
    //     fontWeight: FontWeight.bold,
    //   ),
    //   content: Padding(
    //     padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       mainAxisSize: MainAxisSize.min,
    //       children: [
    //         TextField(
    //           onChanged: onChangedName,
    //           keyboardType: TextInputType.text,
    //           style: const TextStyle(fontSize: 15),
    //           decoration: InputDecoration(
    //               labelText: 'Name',
    //               border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(10))),
    //         ),
    //         const SizedBox(height: 10),
    //         TextField(
    //           onChanged: onChangedAddress,
    //           keyboardType: TextInputType.text,
    //           style: const TextStyle(fontSize: 15),
    //           decoration: InputDecoration(
    //               labelText: 'Address',
    //               border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(10))),
    //         ),
    //         const SizedBox(height: 10),
    //         TextField(
    //           onChanged: onChangedPhone,
    //           keyboardType: TextInputType.text,
    //           style: const TextStyle(fontSize: 15),
    //           decoration: InputDecoration(
    //               labelText: 'Phone',
    //               border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(10))),
    //         ),
    //         const SizedBox(height: 10),
    //         TextField(
    //           onChanged: onChangedDescription,
    //           keyboardType: TextInputType.text,
    //           style: const TextStyle(fontSize: 15),
    //           decoration: InputDecoration(
    //               labelText: 'Description',
    //               border: OutlineInputBorder(
    //                   borderRadius: BorderRadius.circular(10))),
    //         ),
    //         const SizedBox(height: 10),
    //         Row(
    //           children: [
    //             const CustomTextWidget(
    //               text: 'Status: ',
    //             ),
    //             Obx(
    //               () => Checkbox(
    //                 activeColor: Colors.green,
    //                 value: status.value,
    //                 onChanged: onChangedStatus,
    //               ),
    //             ),
    //             Obx(
    //               () => CustomTextWidget(
    //                 text: status.value ? 'Active' : 'Inactive',
    //               ),
    //             ),
    //           ],
    //         ),
    //       ],
    //     ),
    //   ),
    //   actions: <Widget>[
    //     TextButton(
    //       onPressed: () {
    //         if (name.value.isEmpty ||
    //             address.value.isEmpty ||
    //             phone.value.isEmpty ||
    //             description.value.isEmpty) {
    //         } else {
    //           dataMockDoctor.value.add(Doctor(
    //               name: name.value,
    //               address: address.value,
    //               phone: phone.value,
    //               status: status.value,
    //               description: description.value));
    //           dataMockDoctor.refresh();
    //         }
    //         Get.back();
    //         clearData();
    //       },
    //       child: const CustomTextWidget(
    //         text: 'Add',
    //         txtColor: Colors.black,
    //       ),
    //     ),
    //     TextButton(
    //       onPressed: Get.back,
    //       child: const CustomTextWidget(
    //         text: 'Cancel',
    //         txtColor: Colors.black,
    //       ),
    //     ),
    //   ],
    // ));
    Get.dialog(EditDoctorDialog(
      onChangedName: onChangedName,
      onChangedAddress: onChangedAddress,
      onChangedPhone: onChangedPhone,
      onChangedDescription: onChangedDescription,
      onChangedStatus: onChangedStatus,
      addDoctor: addDoctor,
      textControllerName: textControllerName,
      textControllerAddress: textControllerAddress,
      textControllerDescription: textControllerDescription,
      textControllerPhone: textControllerPhone,
    ));
  }

  void addDoctor() {
    if (textControllerName.text.isEmpty ||
        textControllerAddress.text.isEmpty ||
        textControllerPhone.text.isEmpty ||
        textControllerDescription.text.isEmpty) {
    } else {
      dataMockDoctor.value.add(Doctor(
          name: textControllerName.text,
          address: textControllerAddress.text,
          phone: textControllerPhone.text,
          status: status.value,
          description: textControllerDescription.text));
      dataMockDoctor.refresh();
      clearData();
      Get.back();
    }
  }

  void showEditDialog(BuildContext context, Doctor doctor) {
    status.value = doctor.status;
    Get.dialog(AlertDialog(
      title: const CustomTextWidget(
        text: 'Edit Doctor',
        fontWeight: FontWeight.bold,
      ),
      content: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              onChanged: onChangedName,
              keyboardType: TextInputType.text,
              controller: TextEditingController(
                text: doctor.name,
              ),
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Doctor Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: onChangedAddress,
              keyboardType: TextInputType.text,
              controller: TextEditingController(
                text: doctor.address,
              ),
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: onChangedPhone,
              keyboardType: TextInputType.text,
              controller: TextEditingController(
                text: doctor.phone,
              ),
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: onChangedDescription,
              keyboardType: TextInputType.text,
              controller: TextEditingController(
                text: doctor.description,
              ),
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const CustomTextWidget(
                  text: 'Status: ',
                ),
                Obx(
                  () => Checkbox(
                    activeColor: Colors.green,
                    value: status.value,
                    onChanged: onChangedStatus,
                  ),
                ),
                Obx(
                  () => CustomTextWidget(
                    text: status.value ? 'Active' : 'Inactive',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            doctor.name = textControllerName.text.isEmpty
                ? doctor.name
                : textControllerName.text;
            doctor.address = textControllerAddress.text.isEmpty
                ? doctor.address
                : textControllerAddress.text;
            doctor.phone = textControllerPhone.text.isEmpty
                ? doctor.phone
                : textControllerPhone.text;
            doctor.status = status.value;
            doctor.description = textControllerDescription.text.isEmpty
                ? doctor.description
                : textControllerDescription.text;
            dataMockDoctor.refresh();
            Get.back();
            clearData();
          },
          child: const CustomTextWidget(
            text: 'Save',
            txtColor: Colors.black,
          ),
        ),
        TextButton(
          onPressed: Get.back,
          child: const CustomTextWidget(
            text: 'Cancel',
            txtColor: Colors.black,
          ),
        ),
      ],
    ));
  }

  void showDeleteDialog(BuildContext context, Doctor doctor) {
    Get.dialog(AlertDialog(
      icon: const Icon(
        Icons.delete,
        color: Colors.red,
      ),
      title: const CustomTextWidget(
        text: 'Delete Doctor',
        fontWeight: FontWeight.bold,
      ),
      content: const Text('Do you want to DELETE this Doctor?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            dataMockDoctor.value.remove(doctor);
            dataMockDoctor.refresh();
            Get.back();
          },
          child: const CustomTextWidget(
            text: 'Delete',
            txtColor: Colors.red,
          ),
        ),
        TextButton(
          onPressed: Get.back,
          child: const CustomTextWidget(
            text: 'Cancel',
            txtColor: Colors.black,
          ),
        ),
      ],
    ));
  }
}
