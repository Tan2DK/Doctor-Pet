import 'package:doctor_pet/common_widget/custom_text/custom_text_widget.dart';
import 'package:doctor_pet/core/data/staff.dart';
import 'package:doctor_pet/data/data_mock/data_mock_staff.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffController extends GetxController {
  Rx<List<Staff>> dataMockStaff = Rx<List<Staff>>([]);
  Rx<String> name = Rx<String>('');
  Rx<String> address = Rx<String>('');
  Rx<String> phone = Rx<String>('');
  Rx<bool> status = Rx<bool>(false);
  Rx<DateTime> birthday = Rx<DateTime>(DateTime.now());

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

  void onChangedBirthday(DateTime? value) {
    birthday.value = value ?? DateTime(2024);
  }

  void selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2200),
    );
    if (picked != null) {
      birthday.value = picked;
    }
    birthday.refresh();
  }

  void clearData() {
    name.value = '';
    address.value = '';
    phone.value = '';
    status.value = false;
    birthday.value = DateTime.now();
  }

  @override
  void onInit() {
    super.onInit();
    dataMockStaff.value = mockStaff;
  }

  void showEditDialog(BuildContext context, Staff staff) {
    birthday.value = staff.birthday;
    status.value = staff.status;
    Get.dialog(AlertDialog(
      title: CustomTextWidget(
        text: 'Edit Staff',
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
                text: staff.name,
              ),
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Staff Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 10),
            TextField(
              onChanged: onChangedAddress,
              keyboardType: TextInputType.text,
              controller: TextEditingController(
                text: staff.address,
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
                text: staff.phone,
              ),
              style: TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Border color
                  width: 0.5, // Border width
                ),
                borderRadius:
                    BorderRadius.circular(8.0), // Optional: for rounded corners
              ),
              padding: EdgeInsets.all(
                  8.0), // Optional: for padding around the widget
              child: Row(
                children: [
                  CustomTextWidget(
                    text: 'Birthday: ',
                  ),
                  Obx(
                    () => TextButton.icon(
                        icon: Icon(Icons.calendar_month_outlined,
                            color: Colors.black54),
                        onPressed: () {
                          selectDate(context);
                        },
                        label: CustomTextWidget(
                          text:
                              '${birthday.value.day}-${birthday.value.month}-${birthday.value.year}',
                          txtColor: Colors.black,
                        )),
                  ),
                ],
              ),
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
            staff.name = name.value.isEmpty ? staff.name : name.value;
            staff.address = address.isEmpty ? staff.address : address.value;
            staff.phone = phone.isEmpty ? staff.phone : phone.value;
            staff.status = status.value;
            staff.birthday = birthday.value;
            dataMockStaff.refresh();
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

  void showDeleteDialog(BuildContext context, Staff staff) {
    Get.dialog(AlertDialog(
      icon: Icon(
        Icons.delete,
        color: Colors.red,
      ),
      title: Text('Delete Staff'),
      content: Text('Do you want to DELETE this Staff?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            dataMockStaff.value.remove(staff);
            dataMockStaff.refresh();
            Navigator.of(context).pop();
          },
          child: Text('Yes'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('No'),
        ),
      ],
    ));
  }

  void showAddDialog(BuildContext context) {
    Get.dialog(AlertDialog(
      title: CustomTextWidget(
        text: 'Add Staff',
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
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black, // Border color
                  width: 0.5, // Border width
                ),
                borderRadius:
                    BorderRadius.circular(8.0), // Optional: for rounded corners
              ),
              padding: EdgeInsets.all(
                  8.0), // Optional: for padding around the widget
              child: Row(
                children: [
                  CustomTextWidget(
                    text: 'Birthday: ',
                  ),
                  Obx(
                    () => TextButton.icon(
                        icon: Icon(Icons.calendar_month_outlined,
                            color: Colors.black54),
                        onPressed: () {
                          selectDate(context);
                        },
                        label: CustomTextWidget(
                          text:
                              '${birthday.value.day}-${birthday.value.month}-${birthday.value.year}',
                          txtColor: Colors.black,
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
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
                phone.value.isEmpty) {
            } else {
              dataMockStaff.value.add(Staff(
                  name: name.value,
                  address: address.value,
                  phone: phone.value,
                  status: status.value,
                  birthday: birthday.value));
              dataMockStaff.refresh();
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
}
