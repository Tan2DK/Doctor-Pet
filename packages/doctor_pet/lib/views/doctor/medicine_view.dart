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
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Medicine View'),
      ),
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
            DataTable(
              columns: [
                DataColumn(label: Text('IDMedi')),
                DataColumn(label: Text('Name')),
                DataColumn(label: Text('Medicine Name')),
                DataColumn(label: Text('Date')),
                DataColumn(label: Text('Expiration Date')),
                DataColumn(label: Text('Price')),
              ],
              rows: data.map((medicine) {
                return DataRow(cells: [
                  DataCell(Text(medicine.idMedicine)),
                  DataCell(Text(medicine.nameMedicine)),
                  DataCell(Text(medicine.companyMedicineName)),
                  DataCell(Text(medicine.dateMedicine.toString())),
                  DataCell(Text(medicine.expirationdate)),
                  DataCell(Text(medicine.price)),
                ]);
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddMedicineDialog(context, data);
        },
        child: Icon(Icons.local_hospital),
      ),
    );
  }

  void _showAddMedicineDialog(BuildContext context, List<medicine> data) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Medicine'),
          content: SingleChildScrollView(
            child: Column(
              children: data.map((medicine) {
                return CheckboxListTile(
                  title: Text(medicine.nameMedicine),
                  value: false, // Initially unchecked
                  onChanged: (bool? value) {
                    // Add logic for selecting/unselecting the medicine
                  },
                );
              }).toList(),
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add logic for saving the selected medicines
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
