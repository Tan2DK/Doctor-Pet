import 'package:doctor_pet/common_widget/custom_searchbar_widget.dart';
import 'package:doctor_pet/core/data/patient.dart';
import 'package:doctor_pet/views/clinic_manager/patient/patient_controller.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/common_widget/data_title_widget.dart';
import 'package:doctor_pet/core/data/DataTitleModel.dart';
import 'package:get/get.dart';


class PatientView extends GetView<PatientController> {
  const PatientView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    List<patient> dataPatient = List.from(controller.dataPatient);

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 254, 234, 234),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomSearchBarWidget(),
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
                              controller.showOwnerInfoDialog(context);
                              break;
                            case 'pet':
                              controller.showPetInfoDialog(context);
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
}
