import 'package:doctor_pet/common_widget/custom_searchbar_widget.dart';
import 'package:doctor_pet/core/data/doctor.dart';
import 'package:doctor_pet/core/data/staff.dart';
import 'package:doctor_pet/views/clinic_manager/staff/staff_controller.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/core/data/medicine.dart';
import 'package:doctor_pet/common_widget/data_title_widget.dart';
import 'package:doctor_pet/core/data/DataTitleModel.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/core/data/datasources/staff_list.dart';

class StaffView extends GetView<StaffController> {
  const StaffView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<staff> data = List.from(controller.data);
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
                  'Staff Management',
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
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                    ),
                    icon: Icon(Icons.sort_rounded, color: Colors.black54),
                    label: Text(
                      'Sort',
                      style: TextStyle(color: Colors.black54),
                    )),
                SizedBox(width: 10),
                ElevatedButton.icon(
                    onPressed: () {
                      controller.showAddDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    icon: Icon(Icons.add, color: Colors.white),
                    label: Text(
                      'Add Staff',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            DataTitleWidget(
              titles: [
                DataTitleModel(name: 'Staff Name', flex: 4),
                DataTitleModel(name: 'Address', flex: 4),
                DataTitleModel(name: 'Phone', flex: 4),
                DataTitleModel(name: 'Status', flex: 2),
                DataTitleModel(name: 'Birthday', flex: 4),
                DataTitleModel(name: '', flex: 1),
              ],
            ),
            const Divider(thickness: 2),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    // _showAddDialog(context);
                  },
                  child: Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: DataTitleWidget(
                          titles: [
                            DataTitleModel(name: data[index].name, flex: 4),
                            DataTitleModel(name: data[index].address, flex: 4),
                            DataTitleModel(
                                name: data[index].phone.toString(), flex: 4),
                            DataTitleModel(name: data[index].status, flex: 2),
                            DataTitleModel(
                                name: data[index].birthday.toString(), flex: 4),
                          ],
                        ),
                      ),
                      Container(
                        width: 60, // Set the width of the container
                        child: PopupMenuButton<String>(
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            PopupMenuItem<String>(
                              value: 'edit',
                              child: ListTile(
                                leading: Icon(Icons.edit),
                                title: Text('Edit'),
                              ),
                            ),
                            PopupMenuItem<String>(
                              value: 'delete',
                              child: ListTile(
                                leading: Icon(Icons.delete),
                                title: Text('Delete'),
                              ),
                            ),
                          ],
                          onSelected: (String action) {
                            // Handle menu item selection
                            switch (action) {
                              case 'edit':
                                controller.showEditDialog(context, data[index]);
                                break;
                              case 'delete':
                                controller.showDeleteDialog(context);
                                break;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                itemCount: data.length,
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
