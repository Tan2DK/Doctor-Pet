import 'package:doctor_pet/common_widget/custom_text/custom_text_widget.dart';
import 'package:doctor_pet/core/data/doctor.dart';
import 'package:doctor_pet/data/data_mock/data_mock_doctor.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ClinicDoctorController extends GetxController {
  Rx<List<Doctor>> dataMockDoctor = Rx<List<Doctor>>([]);

  Rx<String> name = Rx<String>('');
  Rx<String> address = Rx<String>('');
  Rx<String> phone = Rx<String>('');
  Rx<bool> status = Rx<bool>(false);
  Rx<String> description = Rx<String>('');

  void onChangedName(String? value) {
    name.value = value ?? '';
  }

  void onChangedAddress(String? value) {
    address.value = value ?? '';
  }

  void onChangedPhone(String? value) {
    phone.value = value ?? '';
  }

  void onChangedStatus(bool? value) {
    status.value = value == true ? true : false;
  }

  void onChangedDescription(String? value) {
    description.value = value ?? '';
  }

  void clearData() {
    name.value = '';
    address.value = '';
    phone.value = '';
    status.value = false;
    description.value = '';
  }

  @override
  void onInit() {
    super.onInit();
    dataMockDoctor.value = mockDoctor;
  }

  void showAddDialog(BuildContext context) {
    Get.dialog(AlertDialog(
      title: const CustomTextWidget(
        text: 'Add Doctor',
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
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: onChangedAddress,
              keyboardType: TextInputType.text,
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
            if (name.value.isEmpty ||
                address.value.isEmpty ||
                phone.value.isEmpty ||
                description.value.isEmpty) {
            } else {
              dataMockDoctor.value.add(Doctor(
                  name: name.value,
                  address: address.value,
                  phone: phone.value,
                  status: status.value,
                  description: description.value));
              dataMockDoctor.refresh();
            }
            Get.back();
            clearData();
          },
          child: const CustomTextWidget(
            text: 'Add',
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
            doctor.name = name.value.isEmpty ? doctor.name : name.value;
            doctor.address = address.isEmpty ? doctor.address : address.value;
            doctor.phone = phone.isEmpty ? doctor.phone : phone.value;
            doctor.status = status.value;
            doctor.description = description.value.isEmpty
                ? doctor.description
                : description.value;
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
