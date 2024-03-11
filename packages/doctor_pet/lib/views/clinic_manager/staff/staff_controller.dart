import 'package:doctor_pet/core/data/staff.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffController extends GetxController {
  List<staff> data = [
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
      staff(
        name: 'Nguyen Van A',
        address: 'Viet Nam',
        phone: '01122334455',
        status: 'Active',
        birthday: DateTime(2021, 9, 7, 17, 30, 20),
      ),
    ];

  void showEditDialog(BuildContext context, staff staff) {
    // Implement logic to show edit medicine dialog
    DateTime dateTime = DateTime(2024);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Staff'),
          // Add text fields pre-filled with medicine information
          content: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      hintText: ('dasda'),
                      labelText: 'Staff Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          size: 15,
                        ),
                        onPressed: () {
                          showDatePicker(
                              context: context,
                              initialDate: dateTime,
                              firstDate: (DateTime(1900, 1, 1)),
                              lastDate: (DateTime(2500, 12, 31)));
                        },
                      ),
                      labelText: 'Birthday',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Add logic for saving the edited medicine
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void showDeleteDialog(BuildContext context) {
    // Implement logic to show add medicine dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          title: Text('Delete Staff'),
          content: Text('Do you want to DELETE this Staff?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Add logic for saving the new medicine
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
        );
      },
    );
  }

  void showAddDialog(BuildContext context) {
    DateTime dateTime = DateTime(2024);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Staff'),
          content: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      labelText: 'Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      labelText: 'Address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      labelText: 'Status',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          size: 15,
                        ),
                        onPressed: () {
                          showDatePicker(
                              context: context,
                              initialDate: dateTime,
                              firstDate: (DateTime(1900, 1, 1)),
                              lastDate: (DateTime(2500, 12, 31)));
                        },
                      ),
                      labelText: 'Birthday',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Add logic for saving the new medicine
                Navigator.of(context).pop();
              },
              child: Text('Add'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

}