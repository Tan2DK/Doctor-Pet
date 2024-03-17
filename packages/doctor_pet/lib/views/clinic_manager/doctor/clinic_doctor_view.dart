import 'package:doctor_pet/common_widget/custom_searchbar_widget.dart';
import 'package:doctor_pet/common_widget/custom_text/custom_text_widget.dart';
import 'package:doctor_pet/core/data/data_title_model.dart';
import 'package:doctor_pet/core/data/doctor.dart';
import 'package:doctor_pet/views/clinic_manager/doctor/clinic_doctor_controller.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/common_widget/data_title_widget.dart';
import 'package:get/get.dart';

import '../../../common_widget/custom_button/custom_button_action_widget.dart';

class ClinicDoctorView extends GetView<ClinicDoctorController> {
  const ClinicDoctorView({super.key});
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
                CustomButtonActionWidget(
                  label: 'Sort',
                  bgColor: Colors.white,
                  txtColor: Colors.black54,
                  icon: Icons.sort_rounded,
                  iconColor: Colors.black54,
                  onPressed: () {},
                ),
                const SizedBox(width: 10),
                CustomButtonActionWidget(
                  label: 'Add Doctor',
                  bgColor: Colors.blue,
                  txtColor: Colors.white,
                  icon: Icons.add,
                  iconColor: Colors.white,
                  onPressed: () => controller.showAddEditDialog(context),
                ),
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
              child: Obx(() {
                final List<Doctor> data = controller.dataMockDoctor.value;
                return ListView.builder(
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
                            DataTitleModel(
                                name:
                                    data[index].status ? 'Active' : 'Inactive',
                                flex: 2),
                            DataTitleModel(
                                name: data[index].description, flex: 2),
                          ],
                        ),
                      ),
                      SizedBox(
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
                                controller.showAddEditDialog(
                                  context,
                                  index: index,
                                );
                                break;
                              case 'delete':
                                controller.showDeleteDialog(
                                  context,
                                  index,
                                );
                                break;
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                  itemCount: data.length,
                );
              }),
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
