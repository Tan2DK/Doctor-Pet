import 'package:doctor_pet/core/data/medicinereport.dart';
import 'package:doctor_pet/core/data/patient.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/core/data/pet.dart';
import 'package:doctor_pet/core/data/owner.dart';
import 'package:doctor_pet/comon_wiget/DataTitleWidget.dart';
import 'package:doctor_pet/core/data/DataTitleModel.dart';

class MedicineReportView extends StatelessWidget {
  const MedicineReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<medicinereport> dataMedicneReport = [
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),
      medicinereport(
          medicineName: 'Thuoc ho', unitPrice: 6, quantity: 5, totalPrice: 6),

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
                'Medicine Report',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                    icon: Icon(Icons.calendar_month_outlined,
                        color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 28, 195, 142),
                    ),
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          firstDate: (DateTime(1900, 1, 1)),
                          lastDate: (DateTime(2500, 12, 31)));
                    },
                    label: Text(
                      'Select Start Day',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                ElevatedButton.icon(
                    icon: Icon(Icons.calendar_month_outlined,
                        color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 189, 50, 22),
                    ),
                    onPressed: () {
                      showDatePicker(
                          context: context,
                          firstDate: (DateTime(1900, 1, 1)),
                          lastDate: (DateTime(2500, 12, 31)));
                    },
                    label: Text(
                      'Select End Day',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                ElevatedButton.icon(
                    icon: Icon(Icons.slideshow, color: Colors.white),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 102, 169, 228),
                    ),
                    onPressed: () {},
                    label: Text(
                      'Show Report',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            DataTitleWidget(
              titles: [
                DataTitleModel(name: 'Medicine Name', flex: 4),
                DataTitleModel(name: 'Price', flex: 2),
                DataTitleModel(name: 'Quantity', flex: 2),
                DataTitleModel(name: 'Total Price', flex: 2),
              ],
            ),
            const Divider(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: DataTitleWidget(
                        titles: [
                          DataTitleModel(
                              name: dataMedicneReport[index].medicineName,
                              flex: 4),
                          DataTitleModel(
                              name:
                                  dataMedicneReport[index].unitPrice.toString(),
                              flex: 2),
                          DataTitleModel(
                              name:
                                  dataMedicneReport[index].quantity.toString(),
                              flex: 2),
                          DataTitleModel(
                              name: dataMedicneReport[index]
                                  .totalPrice
                                  .toString(),
                              flex: 2),
                        ],
                      ),
                    ),
                    // Container(
                    //   width: 100, // Set the width of the container
                    //   child: PopupMenuButton<String>(
                    //     itemBuilder: (BuildContext context) =>
                    //         <PopupMenuEntry<String>>[
                    //       PopupMenuItem<String>(
                    //         value: 'info',
                    //         child: ListTile(
                    //           leading: Icon(Icons.info),
                    //           title: Text('Information'),
                    //         ),
                    //       ),
                    //       PopupMenuItem<String>(
                    //         value: 'info2',
                    //         child: ListTile(
                    //           leading: Icon(
                    //             Icons.info,
                    //             color: Colors.blue,
                    //           ),
                    //           title: Text(
                    //             'Detail Information',
                    //             style: TextStyle(color: Colors.blue),
                    //           ),
                    //         ),
                    //       ),
                    //     ],
                    //     onSelected: (String action) {
                    //       // Handle menu item selection
                    //       switch (action) {
                    //         case 'infor':
                    //           // _showOwnerInfoDialog(context);
                    //           break;
                    //         case 'infor2':
                    //           // _showPetInfoDialog(context);
                    //           break;
                    //       }
                    //     },
                    //   ),
                    // ),
                  ],
                ),
                itemCount: dataMedicneReport.length,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Total due: ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('\$100'),
                SizedBox(
                  width: 150,
                )
              ],
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
