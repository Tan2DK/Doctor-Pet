import 'package:flutter/material.dart';
import 'package:doctor_pet/core/data/medicine.dart';
import 'package:doctor_pet/core/data/doctor.dart';
import 'package:doctor_pet/comon_wiget/DataTitleWidget.dart';
import 'package:doctor_pet/core/data/DataTitleModel.dart';

class MedicineView extends StatelessWidget {
  const MedicineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<medicine> data = [
      medicine(
          dateMedicine: DateTime(2017, 11, 11),
          idMedicine: '01',
          nameMedicine: 'panadone',
          quantity: '6',
          companyMedicineName: 'duochaugiang',
          expirationdate: '05/2025',
          price: '5'),
      medicine(
          dateMedicine: DateTime(2017, 11, 11),
          idMedicine: '02',
          nameMedicine: 'thuoc sot',
          quantity: '4',
          companyMedicineName: 'duochaugiang',
          expirationdate: '05/2025',
          price: '5'),
      medicine(
          dateMedicine: DateTime(2017, 11, 11),
          idMedicine: '03',
          nameMedicine: 'panadone',
          quantity: '6',
          companyMedicineName: 'duochaugiang',
          expirationdate: '05/2025',
          price: '5'),
      medicine(
          dateMedicine: DateTime(2017, 11, 11),
          idMedicine: '04',
          nameMedicine: 'panadone',
          quantity: '9',
          companyMedicineName: 'duochaugiang',
          expirationdate: '05/2025',
          price: '5')

      // Add more pets as needed
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
            Center(
              child: Row(
                children: [
                  SizedBox(width: 70),
                  Text(
                    'View Medicine',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 800),
                  ElevatedButton.icon(
                      onPressed: () {
                        _showAddMedicineDialog(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      icon: Icon(Icons.add, color: Colors.white),
                      label: Text(
                        'Add Medicine',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            DataTitleWidget(
              titles: [
                DataTitleModel(name: 'IDMedi', flex: 2),
                DataTitleModel(name: 'Name', flex: 3),
                DataTitleModel(name: 'Medicine Name', flex: 4),
                DataTitleModel(name: 'Quantity', flex: 4),
                DataTitleModel(name: 'Date', flex: 5),
                DataTitleModel(name: 'Expiration date', flex: 5),
                DataTitleModel(name: 'Price', flex: 7),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: DataTitleWidget(
                        titles: [
                          DataTitleModel(name: data[index].idMedicine, flex: 1),
                          DataTitleModel(
                              name: data[index].nameMedicine, flex: 3),
                          DataTitleModel(
                              name: data[index].companyMedicineName, flex: 4),
                          DataTitleModel(name: data[index].quantity, flex: 2),
                          DataTitleModel(
                              name: data[index].dateMedicine.toString(),
                              flex: 5),
                          DataTitleModel(
                              name: data[index].expirationdate, flex: 4),
                          DataTitleModel(name: data[index].price, flex: 4),
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
                              _showAddMedicineDialog(context);
                              break;
                            case 'edit':
                              _showEditMedicineDialog(context, data[index]);
                              break;
                            case 'delete':
                              _showDeleteMedicineDialog(context);
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
          ],
        ),
      ),
    );
  }

  void _showAddMedicineDialog(BuildContext context) {
    DateTime dateTime = DateTime(2024);
    // Implement logic to show add medicine dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Medicine'),
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
                      labelText: 'Medicine Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      labelText: 'Quantity',
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
                      labelText: 'Date',
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
                      labelText: 'Expiration Date',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(height: 10),
                TextField(
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      labelText: 'Price',
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

  void _showEditMedicineDialog(BuildContext context, medicine medicine) {
    DateTime dateTime = DateTime(2024);
    // Implement logic to show edit medicine dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Medicine'),

          // Add text fields pre-filled with medicine information
          content: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: SingleChildScrollView(
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
                  // SizedBox(height: 10),
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
                        labelText: 'Medicine Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        labelText: 'Quantity',
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
                        labelText: 'Date',
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
                        labelText: 'Expiration Date',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    keyboardType: TextInputType.text,
                    style: TextStyle(fontSize: 15),
                    decoration: InputDecoration(
                        labelText: 'Price',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ],
              ),
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

  void _showDeleteMedicineDialog(BuildContext context) {
    // Implement logic to show add medicine dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          icon: Icon(
            Icons.delete,
            color: Colors.red,
          ),
          title: Text('Delete Medicine'),
          content: Text('Do you want to DELETE this medicine?'),
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
