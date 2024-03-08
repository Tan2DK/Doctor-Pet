import 'package:flutter/material.dart';
import 'package:doctor_pet/core/data/medicine.dart';
// Giả định bạn đã định nghĩa các package và class cần thiết như medicine, DataTitleWidget, DataTitleModel.

class MedicineView extends StatelessWidget {
  const MedicineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<medicine> data = [
      medicine(
          dateMedicine: DateTime(2018, 01, 10),
          idMedicine: '05',
          nameMedicine: 'ibuprofen',
          companyMedicineName: 'pharmaco',
          expirationdate: '12/2026',
          price: '8'),
      medicine(
          dateMedicine: DateTime(2019, 02, 15),
          idMedicine: '06',
          nameMedicine: 'acetaminophen',
          companyMedicineName: 'medicorp',
          expirationdate: '11/2024',
          price: '3'),
      medicine(
          dateMedicine: DateTime(2020, 03, 20),
          idMedicine: '07',
          nameMedicine: 'amoxicillin',
          companyMedicineName: 'healthplus',
          expirationdate: '01/2025',
          price: '12'),
      medicine(
          dateMedicine: DateTime(2021, 04, 25),
          idMedicine: '08',
          nameMedicine: 'doxycycline',
          companyMedicineName: 'curewell',
          expirationdate: '03/2027',
          price: '9'),
      medicine(
          dateMedicine: DateTime(2022, 05, 30),
          idMedicine: '09',
          nameMedicine: 'ciprofloxacin',
          companyMedicineName: 'wellpharma',
          expirationdate: '06/2028',
          price: '15'),
      medicine(
          dateMedicine: DateTime(2023, 06, 05),
          idMedicine: '10',
          nameMedicine: 'metformin',
          companyMedicineName: 'lifecare',
          expirationdate: '07/2025',
          price: '7'),
      medicine(
          dateMedicine: DateTime(2018, 07, 10),
          idMedicine: '11',
          nameMedicine: 'simvastatin',
          companyMedicineName: 'healthgen',
          expirationdate: '08/2026',
          price: '10'),
      medicine(
          dateMedicine: DateTime(2019, 08, 15),
          idMedicine: '12',
          nameMedicine: 'lisinopril',
          companyMedicineName: 'medisys',
          expirationdate: '09/2027',
          price: '11'),
      medicine(
          dateMedicine: DateTime(2020, 09, 20),
          idMedicine: '13',
          nameMedicine: 'levothyroxine',
          companyMedicineName: 'pharmacare',
          expirationdate: '10/2028',
          price: '6'),
      medicine(
          dateMedicine: DateTime(2021, 10, 25),
          idMedicine: '14',
          nameMedicine: 'albuterol',
          companyMedicineName: 'breathright',
          expirationdate: '02/2026',
          price: '13'),

      // Thêm các medicine khác tương tự
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
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            const Center(
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
    List<String?> selectedMedicines = [null];
    List<TextEditingController> quantityControllers = [TextEditingController()];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Medicine'),
          content: SingleChildScrollView(
            child: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
                return Column(
                  children: [
                    ...List.generate(selectedMedicines.length, (index) {
                      return Row(
                        children: [
                          Expanded(
                            child: InputDecorator(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 10.0, vertical: 0),
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  value: selectedMedicines[index],
                                  hint: Text('Select Medicine'),
                                  isDense: true,
                                  onChanged: (String? newValue) {
                                    setState(() {
                                      selectedMedicines[index] = newValue;
                                    });
                                  },
                                  items: data.map<DropdownMenuItem<String>>(
                                      (medicine med) {
                                    return DropdownMenuItem<String>(
                                      value: med.nameMedicine,
                                      child: Text(med.nameMedicine),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                              width: 10), // Tạo khoảng cách giữa hai widget
                          Expanded(
                            child: TextField(
                              controller: quantityControllers[index],
                              decoration: InputDecoration(
                                labelText: 'Quantity',
                                border: OutlineInputBorder(),
                              ),
                            ),
                          ),
                        ],
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextButton(
                        onPressed: () {
                          setState(() {
                            selectedMedicines.add(null);
                            quantityControllers.add(TextEditingController());
                          });
                        },
                        child: Text('Add More'),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Xử lý lưu trữ lựa chọn và số lượng ở đây
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
