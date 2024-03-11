import 'package:doctor_pet/common_widget/custom_searchbar_widget.dart';
import 'package:doctor_pet/common_widget/custom_text/custom_text_widget.dart';
import 'package:doctor_pet/core/data/doctor.dart';
import 'package:doctor_pet/views/clinic_manager/doctor/doctor_controller.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/common_widget/data_title_widget.dart';
import 'package:doctor_pet/core/data/DataTitleModel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DoctorView extends GetView<DoctorController> {
  const DoctorView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<doctor> data = List.from(controller.data);

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
                // ignore: unnecessary_const
                const CustomTextWidget(
                  text: 'Doctor Management',
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
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
                    label: const CustomTextWidget(
                      text: 'Sort',
                      txtColor: Colors.black54,
                    )),
                const SizedBox(width: 10),
                ElevatedButton.icon(
                    onPressed: () {
                      controller.showAddDialog(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    icon: const Icon(Icons.add, color: Colors.white),
                    label: const CustomTextWidget(
                      text: 'Add Doctor',
                      txtColor: Colors.white,
                    )),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),
            DataTitleWidget(
              titles: [
                DataTitleModel(
                  name: 'Doctor Name',
                  flex: 2,
                ),
                DataTitleModel(name: 'Address', flex: 2),
                DataTitleModel(name: 'Phone', flex: 2),
                DataTitleModel(name: 'Status', flex: 2),
                DataTitleModel(name: 'Description', flex: 2),
                DataTitleModel(name: '', flex: 1),
              ],
            ),
            const Divider(thickness: 2),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: DataTitleWidget(
                        titles: [
                          DataTitleModel(name: data[index].name, flex: 2),
                          DataTitleModel(name: data[index].address, flex: 2),
                          DataTitleModel(
                              name: data[index].phone.toString(), flex: 2),
                          DataTitleModel(name: data[index].status, flex: 2),
                          DataTitleModel(
                              name: data[index].description, flex: 2),
                        ],
                      ),
                    ),
                    Container(
                      width: 100, // Set the width of the container
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
                itemCount: data.length,
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
