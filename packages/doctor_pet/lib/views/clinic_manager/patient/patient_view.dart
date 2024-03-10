import 'package:doctor_pet/core/data/patient.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/core/data/pet.dart';
import 'package:doctor_pet/core/data/owner.dart';
import 'package:doctor_pet/comon_wiget/DataTitleWidget.dart';
import 'package:doctor_pet/core/data/DataTitleModel.dart';

class PatientView extends StatefulWidget {
  const PatientView({Key? key}) : super(key: key);

  @override
  State<PatientView> createState() => _PatientViewState();
}

class _PatientViewState extends State<PatientView> {
  @override
  Widget build(BuildContext context) {
    final List<patient> dataPatient = [
      patient(ownName: 'Nguyen Van A', petName: 'Dog'),
      patient(ownName: 'One Zi', petName: 'Fish'),
      patient(ownName: 'MCK', petName: 'Horse'),
      patient(ownName: 'Wxrdie', petName: 'Cat'),
      patient(ownName: 'One Zi', petName: 'Fish'),
      patient(ownName: 'One Zi', petName: 'Fish'),
      patient(ownName: 'One Zi', petName: 'Fish'),
      patient(ownName: 'One Zi', petName: 'Fish'),
      patient(ownName: 'One Zi', petName: 'Fish'),
      patient(ownName: 'One Zi', petName: 'Fish'),
      patient(ownName: 'One Zi', petName: 'Fish'),
      patient(ownName: 'One Zi', petName: 'Fish'),
      patient(ownName: 'One Zi', petName: 'Fish'),
      patient(ownName: 'One Zi', petName: 'Fish'),
      patient(ownName: 'One Zi', petName: 'Fish'),
      patient(ownName: 'One Zi', petName: 'Fish'),
      patient(ownName: 'One Zi', petName: 'Fish'),
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
                  'View Patient List',
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
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    icon: Icon(Icons.sort_rounded, color: Colors.black54),
                    label: Text(
                      'Sort',
                      style: TextStyle(color: Colors.black54),
                    )),
                    SizedBox(width: 20,)
              ],
            ),
            SizedBox(height: 10),
            DataTitleWidget(
              titles: [
                DataTitleModel(name: 'Owner Name', flex: 4),
                DataTitleModel(name: 'Pet Name', flex: 5),
                DataTitleModel(name: '', flex: 0),
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
                          DataTitleModel(
                              name: dataPatient[index].ownName, flex: 5),
                          DataTitleModel(
                              name: dataPatient[index].petName, flex: 5),
                        ],
                      ),
                    ),
                    Container(
                      width: 100, // Set the width of the container
                      child: PopupMenuButton<String>(
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          PopupMenuItem<String>(
                            value: 'owner',
                            child: ListTile(
                              leading: Icon(Icons.info),
                              title: Text('Owner Information'),
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'pet',
                            child: ListTile(
                              leading: Icon(Icons.info),
                              title: Text('Pet Information'),
                            ),
                          ),
                        ],
                        onSelected: (String action) {
                          // Handle menu item selection
                          switch (action) {
                            case 'owner':
                              _showOwnerInfoDialog(context);
                              break;
                            case 'pet':
                              _showPetInfoDialog(context);
                              break;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                itemCount: dataPatient.length,
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }

  void _showOwnerInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Owner Information'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('ID: 1'),
              Text('Name: Nguyen Van A'),
              Text('Phone: 011223344'),
              Text('Address: Viet Nam'),
              Text('Birthday: 29/2/2002'),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  void _showPetInfoDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pet Information'),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Pet ID: 1'),
              Text('Pet Name: Lu'),
              Text('Species: Cho Phu Quoc'),
              Text('Color: Yellow'),
              Text('Birthday: 29/2/2002'),
              Text('Origin: Viet Nam')
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
