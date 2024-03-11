import 'package:doctor_pet/core/data/medicine.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MedicineController extends GetxController {
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
          price: '5'),
      medicine(
          dateMedicine: DateTime(2017, 11, 11),
          idMedicine: '04',
          nameMedicine: 'panadone',
          quantity: '9',
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
          price: '5'),
      medicine(
          dateMedicine: DateTime(2017, 11, 11),
          idMedicine: '04',
          nameMedicine: 'panadone',
          quantity: '9',
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
          price: '5'),
      medicine(
          dateMedicine: DateTime(2017, 11, 11),
          idMedicine: '04',
          nameMedicine: 'panadone',
          quantity: '9',
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
          price: '5'),
      medicine(
          dateMedicine: DateTime(2017, 11, 11),
          idMedicine: '04',
          nameMedicine: 'panadone',
          quantity: '9',
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
          price: '5'),
      medicine(
          dateMedicine: DateTime(2017, 11, 11),
          idMedicine: '04',
          nameMedicine: 'panadone',
          quantity: '9',
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
          price: '5'),

      // Add more pets as needed
    ];

  void showEditMedicineDialog(BuildContext context, medicine medicine) {
    DateTime dateTime = DateTime(2024);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Medicine'),
          content: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: SingleChildScrollView(
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


  void showDeleteMedicineDialog(BuildContext context) {
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

  void showAddMedicineDialog(BuildContext context) {
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

}