import 'package:flutter/material.dart';
import 'package:doctor_pet/core/data/mypatients.dart';
import 'package:doctor_pet/comon_wiget/DataTitleWidget.dart';
import 'package:doctor_pet/core/data/DataTitleModel.dart';

class MypatientsView extends StatefulWidget {
  const MypatientsView({Key? key}) : super(key: key);

  @override
  _MypatientsViewState createState() => _MypatientsViewState();
}

class _MypatientsViewState extends State<MypatientsView> {
  late List<mypatients> data;

  @override
  void initState() {
    super.initState();
    data = [
      mypatients(
          CustomerId: '01',
          Name: 'Duy',
          PhoneNumber: '0978376483',
          Birthday: DateTime(1990, 11, 11),
          Address: '123 Main St',
          DateBuyMedicine: DateTime(2017, 11, 11)),
      // Thêm các đối tượng mypatients khác theo mẫu trên
    ];
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
            Center(
              child: Text(
                'View my patients',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            DataTitleWidget(
              titles: [
                DataTitleModel(name: 'ID Customer', flex: 1),
                DataTitleModel(name: 'Name', flex: 2),
                DataTitleModel(name: 'Phone Number', flex: 2),
                DataTitleModel(name: 'Birthday', flex: 2),
                DataTitleModel(name: 'Address', flex: 3),
                DataTitleModel(name: 'Date Buy Medicine', flex: 2),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                      flex: 12,
                      child: DataTitleWidget(
                        titles: [
                          DataTitleModel(name: data[index].CustomerId, flex: 1),
                          DataTitleModel(name: data[index].Name, flex: 2),
                          DataTitleModel(
                              name: data[index].PhoneNumber, flex: 2),
                          DataTitleModel(
                              name: data[index].Birthday.toString(), flex: 2),
                          DataTitleModel(name: data[index].Address, flex: 3),
                          DataTitleModel(
                              name: data[index].DateBuyMedicine.toString(),
                              flex: 2),
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
}
