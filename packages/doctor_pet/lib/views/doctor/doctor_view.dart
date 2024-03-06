import 'package:flutter/material.dart';
import 'package:doctor_pet/core/data/doctor.dart';
import 'package:doctor_pet/comon_wiget/DataTitleWidget.dart';
import 'package:doctor_pet/core/data/DataTitleModel.dart';

class DoctorView extends StatelessWidget {
  const DoctorView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<doctor> data = [
      doctor(
          day: DateTime(2017, 11, 11),
          iddoctor: '01',
          namedoctor: 'Duy',
          email: 'tranduy9872@gmail.com',
          phonenum: '0978376483'),
      doctor(
          day: DateTime(2017, 11, 11),
          iddoctor: '02',
          namedoctor: 'Nhut',
          email: 'minhnhut@gmail.com',
          phonenum: '0978376483'),
      doctor(
          day: DateTime(2017, 11, 11),
          iddoctor: '03',
          namedoctor: 'Tan',
          email: 'tankute@gmail.com',
          phonenum: '0978376483'),
      doctor(
          day: DateTime(2017, 11, 11),
          iddoctor: '04',
          namedoctor: 'Nam',
          email: 'vinh@gmail.com',
          phonenum: '0978376483'),

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
                'View Manager appointment',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            DataTitleWidget(
              titles: [
                DataTitleModel(name: 'ID User', flex: 1),
                DataTitleModel(name: 'Name', flex: 2),
                DataTitleModel(name: 'Email', flex: 3),
                DataTitleModel(name: 'Date', flex: 4),
                DataTitleModel(name: 'Phone', flex: 5),
                DataTitleModel(name: 'Accept', flex: 6),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 5,
                            child: DataTitleWidget(
                              titles: [
                                DataTitleModel(
                                    name: data[index].iddoctor, flex: 1),
                                DataTitleModel(
                                    name: data[index].namedoctor, flex: 2),
                                DataTitleModel(
                                    name: data[index].email, flex: 3),
                                DataTitleModel(
                                  name: data[index].day.toString(),
                                  flex: 4,
                                ),
                                DataTitleModel(
                                    name: data[index].phonenum, flex: 5),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Switch(
                              value: data[index].accepted,
                              onChanged: (newValue) {
                                // Update the accepted status when the switch is toggled
                                data[index].accepted = newValue;
                              },
                            ),
                          ),
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
