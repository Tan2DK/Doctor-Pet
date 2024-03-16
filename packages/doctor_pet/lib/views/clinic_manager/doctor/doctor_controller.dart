import 'package:doctor_pet/common_widget/custom_text/custom_text_widget.dart';
import 'package:doctor_pet/core/data/doctor.dart';
import 'package:doctor_pet/data/datamock/data_mock_doctor.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DoctorController extends GetxController {
  Rx<List<doctor>> dataMockDoctor = Rx<List<doctor>>([]);

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
    dataMockDoctor.value = mockDoctor;
  }

  void showAddDialog(BuildContext context) {
    Get.dialog(AlertDialog(
      title: CustomTextWidget(
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
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: onChangedAddress,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: onChangedPhone,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 10),

            TextField(
              onChanged: onChangedDescription,
              keyboardType: TextInputType.text,
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CustomTextWidget(
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
              dataMockDoctor.value.add(doctor(
                  name: name.value,
                  address: address.value,
                  phone: phone.value,
                  status: status.value,
                  description: description.value));
              dataMockDoctor.refresh();
            }
            Navigator.of(context).pop();
            clearData();
          },
          child: CustomTextWidget(
            text: 'Add',
            txtColor: Colors.black,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: CustomTextWidget(
            text: 'Cancel',
            txtColor: Colors.black,
          ),
        ),
      ],
    ));
  }

  void showEditDialog(BuildContext context, doctor doctor) {
    status.value = doctor.status;
    Get.dialog(AlertDialog(
      title: CustomTextWidget(
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
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Doctor Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: onChangedAddress,
              keyboardType: TextInputType.text,
              controller: TextEditingController(
                text: doctor.address,
              ),
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: onChangedPhone,
              keyboardType: TextInputType.text,
              controller: TextEditingController(
                text: doctor.phone,
              ),
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 10),

            TextField(
              onChanged: onChangedDescription,
              keyboardType: TextInputType.text,
              controller: TextEditingController(
                text: doctor.description,
              ),
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Description',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                CustomTextWidget(
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
            Navigator.of(context).pop();
            clearData();
          },
          child: CustomTextWidget(
            text: 'Save',
            txtColor: Colors.black,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: CustomTextWidget(
            text: 'Cancel',
            txtColor: Colors.black,
          ),
        ),
      ],
    ));
  }

  void showDeleteDialog(BuildContext context, doctor doctor) {
    Get.dialog(AlertDialog(
      icon: Icon(
        Icons.delete,
        color: Colors.red,
      ),
      title: CustomTextWidget(
        text: 'Delete Doctor',
        fontWeight: FontWeight.bold,
      ),
      content: Text('Do you want to DELETE this Doctor?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            dataMockDoctor.value.remove(doctor);
            dataMockDoctor.refresh();
            Navigator.of(context).pop();
          },
          child: CustomTextWidget(
            text: 'Delete',
            txtColor: Colors.red,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: CustomTextWidget(
            text: 'Cancel',
            txtColor: Colors.black,
          ),
        ),
      ],
    ));
  }
}
