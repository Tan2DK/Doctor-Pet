import 'package:doctor_pet/core/data/doctor.dart';
import 'package:doctor_pet/core/data/staff.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/core/data/medicine.dart';
import 'package:doctor_pet/comon_wiget/DataTitleWidget.dart';
import 'package:doctor_pet/core/data/DataTitleModel.dart';

class StaffView extends StatefulWidget {
  const StaffView({Key? key}) : super(key: key);

  @override
  State<StaffView> createState() => _StaffViewState();
}

class _StaffViewState extends State<StaffView> {
  List<staff> data = [];

  @override
  void initState() {
    data.add(staff(
      name: 'One Zi',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Quang Zi',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Zi Zi Zi Zi',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Hihihihi',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Nguyen Van Dep Trai',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Nguyen Thi C',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Zi Zi Zi Zi',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Zi Zi Zi Zi',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Zi Zi Zi Zi',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Tran Thi A',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Zi Zi Zi Zi',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Zi Zi Zi Zi',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Zi Zi Zi Zi',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'One Zi',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Quang Zi',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Zi Zi Zi Zi',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Hihihihi',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Nguyen Van Dep Trai',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Nguyen Thi C',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Tran Thi B',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
    data.add(staff(
      name: 'Nguyen Van A',
      address: 'Viet Nam',
      phone: 01122334455,
      status: 'Active',
      birthday: DateTime(2021, 9, 7, 17, 30, 20),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 254, 234, 234),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                SizedBox(width: 70),
                Text(
                  'Staff Management',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ElevatedButton.icon(
                    onPressed: () {
                      // Add a function to sort object staff by name A-Z
                      // _sortStaffList();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    icon: Icon(Icons.sort_rounded, color: Colors.black54),
                    label: Text(
                      'Sort',
                      style: TextStyle(color: Colors.black54),
                    )),
                SizedBox(width: 10),
                ElevatedButton.icon(
                    onPressed: () {
                      _showAddDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    icon: Icon(Icons.add, color: Colors.white),
                    label: Text(
                      'Add Staff',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            DataTitleWidget(
              titles: [
                DataTitleModel(name: 'Staff Name', flex: 3),
                DataTitleModel(name: 'Address', flex: 3),
                DataTitleModel(name: 'Phone', flex: 3),
                DataTitleModel(name: 'Status', flex: 3),
                DataTitleModel(name: 'Birthday', flex: 3),

              ],
            ),
            const Divider(thickness: 2),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    // _showAddDialog(context);
                  },
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: DataTitleWidget(
                          titles: [
                            DataTitleModel(name: data[index].name, flex: 3),
                            DataTitleModel(name: data[index].address, flex: 3),
                            DataTitleModel(
                                name: data[index].phone.toString(), flex: 3),
                            DataTitleModel(name: data[index].status, flex: 3),
                            DataTitleModel(
                                name: data[index].birthday.toString(), flex: 3),
                          ],
                        ),
                      ),
                      Container(
                        width: 50, // Set the width of the container
                        child: PopupMenuButton<String>(
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'edit',
                              child: ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'delete',
                              child: ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('Delete'),
                              ),
                            ),
                          ],
                          onSelected: (String action) {
                            // Handle menu item selection
                            switch (action) {
                              case 'edit':
                                _showEditDialog(context, data[index]);
                                break;
                              case 'delete':
                                _showDeleteDialog(context);
                                break;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                itemCount: data.length,
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    DateTime dateTime = DateTime(2024);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Staff'),
          // Add text fields and buttons for adding medicine
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

  void _showEditDialog(BuildContext context, staff staff) {
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
                // TextField(
                //   keyboardType: TextInputType.text,
                //   style: TextStyle(fontSize: 15),
                //   decoration: InputDecoration(
                //       labelText: 'Quantity',
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10))),
                // ),
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

  void _showDeleteDialog(BuildContext context) {
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
}
