import 'package:doctor_pet/core/data/doctor.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/comon_wiget/DataTitleWidget.dart';
import 'package:doctor_pet/core/data/DataTitleModel.dart';
import 'package:flutter/widgets.dart';



class DoctorView extends StatefulWidget {
  const DoctorView({Key? key}) : super(key: key);

  @override
  State<DoctorView> createState() => _DoctorViewState();
}

class _DoctorViewState extends State<DoctorView> {


  @override
  Widget build(BuildContext context) {
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
                  'Doctor Management',
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
                      'Add Doctor',
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
                DataTitleModel(name: 'Doctor Name', flex: 2,),
                DataTitleModel(name: 'Address', flex: 2),
                DataTitleModel(name: 'Phone', flex: 2),
                DataTitleModel(name: 'Status', flex: 2),
                DataTitleModel(name: 'Description', flex: 2),
                DataTitleModel(name: '', flex: 1),
              ],
            ),
            const Divider(thickness: 2),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: DataTitleWidget(
                        titles: [
                          DataTitleModel(name: data[index].name, flex: 2),
                          DataTitleModel(name: data[index].address, flex: 2),
                          DataTitleModel(
                              name: data[index].phone.toString(), flex: 2),
                          DataTitleModel(name: data[index].status, flex: 2),
                          DataTitleModel(
                              name: data[index].description, flex: 2),
                        ],
                      ),
                    ),
                    Container(
                      width: 100, // Set the width of the container
                      child: PopupMenuButton<String>(
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          // PopupMenuItem<String>(
                          //   value: 'add',
                          //   child: ListTile(
                          //     leading: Icon(Icons.add),
                          //     title: Text('Add'),
                          //   ),
                          // ),
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
                            case 'add':
                              _showAddDialog(context);
                              break;
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
                itemCount: data.length,
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }

  void _showAddDialog(BuildContext context) {
    // Implement logic to show add medicine dialog
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
                // TextField(
                //   keyboardType: TextInputType.text,
                //   style: TextStyle(fontSize: 15),
                //   decoration: InputDecoration(
                //       labelText: 'ID',
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10))),
                // ),

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

  void _showEditDialog(BuildContext context, doctor doctor) {
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
                // TextField(
                //   keyboardType: TextInputType.text,
                //   style: TextStyle(fontSize: 15),
                //   decoration: InputDecoration(
                //       labelText: 'Quantity',
                //       border: OutlineInputBorder(
                //           borderRadius: BorderRadius.circular(10))),
                // ),
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
