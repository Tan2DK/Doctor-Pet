import 'package:doctor_pet/core/data/invoicereport.dart';
import 'package:doctor_pet/core/data/medicinereport.dart';
import 'package:doctor_pet/core/data/patient.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/core/data/pet.dart';
import 'package:doctor_pet/core/data/owner.dart';
import 'package:doctor_pet/comon_wiget/DataTitleWidget.dart';
import 'package:doctor_pet/core/data/DataTitleModel.dart';

class InvoiceReportView extends StatefulWidget {
  const InvoiceReportView({Key? key}) : super(key: key);

  @override
  State<InvoiceReportView> createState() => _InvoiceReportViewState();
}

class _InvoiceReportViewState extends State<InvoiceReportView> {
  @override
  Widget build(BuildContext context) {
    final List<invoicereport> dataInvoiceReport = [
      invoicereport(
          patientID: '1',
          patientName: 'One Zi',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc ho'),
      invoicereport(
          patientID: '2',
          patientName: 'Duck Ant',
          cost: 7,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc cam'),
      invoicereport(
          patientID: '1',
          patientName: 'Two Zi',
          cost: 7,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc sot'),
      invoicereport(
          patientID: '1',
          patientName: 'oK',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc tieu chay'),
      invoicereport(
          patientID: '1',
          patientName: 'oK',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc tieu chay'),
      invoicereport(
          patientID: '1',
          patientName: 'oK',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc tieu chay'),
      invoicereport(
          patientID: '1',
          patientName: 'oK',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc tieu chay'),
      invoicereport(
          patientID: '1',
          patientName: 'oK',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc tieu chay'),
      invoicereport(
          patientID: '1',
          patientName: 'oK',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc tieu chay'),
      invoicereport(
          patientID: '1',
          patientName: 'oK',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc tieu chay'),
      invoicereport(
          patientID: '34',
          patientName: 'Duy',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc tieu chay'),
      invoicereport(
          patientID: '123',
          patientName: 'Dep trai',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc tieu chay'),
      invoicereport(
          patientID: '13',
          patientName: 'Nguyen Van A',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc tieu chay'),
      invoicereport(
          patientID: '1',
          patientName: 'Tran Thi B',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc tieu chay'),
      invoicereport(
          patientID: '1',
          patientName: 'oK',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc tieu chay'),
      invoicereport(
          patientID: '1',
          patientName: 'One Zi',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc tieu chay'),
      invoicereport(
          patientID: '1',
          patientName: 'Nguyen Van Dep Trai',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc tieu chay'),
      invoicereport(
          patientID: '1',
          patientName: 'oK',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc tieu chay'),
      invoicereport(
          patientID: '1',
          patientName: 'oK',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc tieu chay'),
      invoicereport(
          patientID: '1',
          patientName: 'oK',
          cost: 5,
          day: DateTime(2024, 3, 7, 12, 6, 43),
          prescription: 'Thuoc tieu chay'),

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
                'Invoice Report',
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
                DataTitleModel(
                  name: 'Patient ID',
                  flex: 2,
                ),
                DataTitleModel(name: 'Patient Name', flex: 4),
                DataTitleModel(name: 'Cost', flex: 2),
                DataTitleModel(name: 'Day', flex: 5),
                DataTitleModel(name: 'Prescription', flex: 5),
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
                              name: dataInvoiceReport[index].patientID,
                              flex: 2),
                          DataTitleModel(
                              name: dataInvoiceReport[index].patientName,
                              flex: 4),
                          DataTitleModel(
                              name: dataInvoiceReport[index].cost.toString(),
                              flex: 2),
                          DataTitleModel(
                              name: dataInvoiceReport[index].day.toString(),
                              flex: 5),
                          DataTitleModel(
                              name: dataInvoiceReport[index].prescription,
                              flex: 5),
                        ],
                      ),
                    ),
                  ],
                ),
                itemCount: dataInvoiceReport.length,
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
}
