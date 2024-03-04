import 'package:flutter/material.dart';
import 'package:doctor_pet/core/data/medicine.dart';
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
          companyMedicineName: 'duochaugiang',
          expirationdate: '05/2025',
          price: '5'),
      medicine(
          dateMedicine: DateTime(2017, 11, 11),
          idMedicine: '02',
          nameMedicine: 'thuoc sot',
          companyMedicineName: 'duochaugiang',
          expirationdate: '05/2025',
          price: '5'),
      medicine(
          dateMedicine: DateTime(2017, 11, 11),
          idMedicine: '03',
          nameMedicine: 'panadone',
          companyMedicineName: 'duochaugiang',
          expirationdate: '05/2025',
          price: '5'),
      medicine(
          dateMedicine: DateTime(2017, 11, 11),
          idMedicine: '04',
          nameMedicine: 'panadone',
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
              child: Text(
                'View Medicine Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            DataTitleWidget(
              titles: [
                DataTitleModel(name: 'IDMedi', flex: 1),
                DataTitleModel(name: 'Name', flex: 2),
                DataTitleModel(name: 'Medicine Name', flex: 3),
                DataTitleModel(name: 'date', flex: 4),
                DataTitleModel(name: 'expiration date', flex: 5),
                DataTitleModel(name: 'price', flex: 6),
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
                              name: data[index].nameMedicine, flex: 2),
                          DataTitleModel(
                              name: data[index].companyMedicineName, flex: 3),
                          DataTitleModel(
                            name: data[index].dateMedicine.toString(),
                            flex: 4,
                          ),
                          DataTitleModel(
                              name: data[index].expirationdate, flex: 5),
                          DataTitleModel(name: data[index].price, flex: 6),
                        ],
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
    // Implement logic to show add medicine dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Medicine'),
          // Add text fields and buttons for adding medicine
          actions: <Widget>[
            TextButton(
              onPressed: () {
                // Add logic for saving the new medicine
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

  void _showEditMedicineDialog(BuildContext context, medicine medicine) {
    // Implement logic to show edit medicine dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Medicine'),
          // Add text fields pre-filled with medicine information
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
}
