import 'package:doctor_pet/core/data/doctor.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class DoctorController extends GetxController {
  final List<doctor> data = [
      doctor(
        name: 'Doctor 1',
        address: 'Viet Nam',
        phone: 01122334455,
        status: 'Active',
        description: 'Bac si nay gioi',
      ),
      doctor(
        name: 'Doctor 1',
        address: 'Viet Nam',
        phone: 01122334455,
        status: 'Active',
        description: 'Bac si nay gioi',
      ),
      doctor(
        name: 'Doctor 1',
        address: 'Viet Nam',
        phone: 01122334455,
        status: 'Active',
        description: 'Bac si nay gioi',
      ),
      doctor(
        name: 'Doctor 1',
        address: 'Viet Nam',
        phone: 01122334455,
        status: 'Active',
        description: 'Bac si nay gioi',
      ),
      doctor(
        name: 'Doctor 1',
        address: 'Viet Nam',
        phone: 01122334455,
        status: 'Active',
        description: 'Bac si nay gioi',
      ),
      doctor(
        name: 'Doctor 1',
        address: 'Viet Nam',
        phone: 01122334455,
        status: 'Active',
        description: 'Bac si nay gioi',
      ),
      doctor(
        name: 'Doctor 1',
        address: 'Viet Nam',
        phone: 01122334455,
        status: 'Active',
        description: 'Bac si nay gioi',
      ),
      doctor(
        name: 'Doctor 1',
        address: 'Viet Nam',
        phone: 01122334455,
        status: 'Active',
        description: 'Bac si nay gioi',
      ),
      doctor(
        name: 'Doctor 1',
        address: 'Viet Nam',
        phone: 01122334455,
        status: 'Active',
        description: 'Bac si nay gioi',
      ),
      doctor(
        name: 'Doctor 1',
        address: 'Viet Nam',
        phone: 01122334455,
        status: 'Active',
        description: 'Bac si nay gioi',
      ),
      doctor(
        name: 'Doctor 1',
        address: 'Viet Nam',
        phone: 01122334455,
        status: 'Active',
        description: 'Bac si nay gioi',
      ),
      doctor(
        name: 'Doctor 1',
        address: 'Viet Nam',
        phone: 01122334455,
        status: 'Active',
        description: 'Bac si nay gioi',
      ),
      doctor(
        name: 'Doctor 1',
        address: 'Viet Nam',
        phone: 01122334455,
        status: 'Active',
        description: 'Bac si nay gioi',
      ),
    ];

  void showAddDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Doctor'),
          // Add text fields and buttons for adding medicine
          content: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
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
                      labelText: 'Description',
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

  void showEditDialog(BuildContext context, doctor doctor) {
    // Implement logic to show edit medicine dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Doctor'),
          // Add text fields pre-filled with medicine information
          content: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      hintText: ('dasda'),
                      labelText: 'Doctor Name',
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
                      labelText: 'Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
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
          title: Text('Delete Doctor'),
          content: Text('Do you want to DELETE this Doctor?'),
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
  
}