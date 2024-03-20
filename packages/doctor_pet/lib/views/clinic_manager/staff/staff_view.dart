import 'package:doctor_pet/common_widget/custom_searchbar_widget.dart';
import 'package:doctor_pet/core/data/staff.dart';
import 'package:doctor_pet/utils/app_extension.dart';
import 'package:doctor_pet/views/clinic_manager/staff/staff_controller.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/common_widget/data_title_widget.dart';
import 'package:get/get.dart';

import '../../../core/data/data_title_model.dart';

class StaffView extends GetView<StaffController> {
  const StaffView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 254, 234, 234),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomSearchBarWidget(),
            const SizedBox(height: 10),
            const Row(
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
                    icon: const Icon(Icons.sort_rounded, color: Colors.black54),
                    label: const Text(
                      'Sort',
                      style: TextStyle(color: Colors.black54),
                    )),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                    onPressed: () => controller.showAddEditStaffDialog(
                          context,
                        ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const Text(
                      'Add Staff',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),
            DataTitleWidget(
              titles: [
                DataTitleModel(name: 'Staff Name', flex: 4),
                DataTitleModel(name: 'Address', flex: 4),
                DataTitleModel(name: 'Phone', flex: 4),
                DataTitleModel(name: 'Status', flex: 2),
                DataTitleModel(name: 'Birthday', flex: 3),
                DataTitleModel(name: '', flex: 1),
              ],
            ),
            const Divider(thickness: 3),
            Expanded(child: Obx(() {
              final List<Staff> data = controller.dataMockStaff.value;
              return ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 1),
                itemBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: DataTitleWidget(
                        titles: [
                          DataTitleModel(name: data[index].name, flex: 4),
                          DataTitleModel(name: data[index].address, flex: 4),
                          DataTitleModel(
                              name: data[index].phone.toString(), flex: 4),
                          DataTitleModel(
                              name: data[index].status ? 'Active' : 'Inactive',
                              flex: 2),
                          DataTitleModel(
                              name: data[index]
                                  .birthday
                                  .formatDateTime('dd-MM-yyyy'),
                              flex: 3),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 60, // Set the width of the container
                      child: PopupMenuButton<String>(
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          const PopupMenuItem<String>(
                            value: 'edit',
                            child: ListTile(
                              leading: Icon(Icons.edit),
                              title: Text('Edit'),
                            ),
                          ),
                          const PopupMenuItem<String>(
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
                              controller.showAddEditStaffDialog(
                                context,
                                index: index,
                              );
                              break;
                            case 'delete':
                              controller.showDeleteDialog(context, index);
                              break;
                          }
                        },
                      ),
                    ),
                  ],
                ),
                itemCount: data.length,
              );
            })),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
