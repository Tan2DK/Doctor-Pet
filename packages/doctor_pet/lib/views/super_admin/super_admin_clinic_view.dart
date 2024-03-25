import 'package:doctor_pet/common_widget/custom_searchbar_widget.dart';
import 'package:doctor_pet/common_widget/custom_text/custom_text_widget.dart';
import 'package:doctor_pet/core/data/clinic.dart';
import 'package:doctor_pet/core/data/data_title_model.dart';
import 'package:doctor_pet/views/super_admin/super_admin_clinic_controller.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/common_widget/data_title_widget.dart';
import 'package:get/get.dart';

import '../../../common_widget/custom_button/custom_button_action_widget.dart';

class SuperAdminClinicView extends GetView<SuperAdminClinicController> {
  const SuperAdminClinicView({super.key});
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
                  text: 'Clinic Management',
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
                    label: 'Add Clinic',
                    bgColor: Colors.blue,
                    txtColor: Colors.white,
                    icon: Icons.add,
                    iconColor: Colors.white,
                    onPressed: () {
                      controller.showAddEditDialog(
                        context,
                      );
                    }),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),
            DataTitleWidget(
              titles: [
                DataTitleModel(
                  name: 'Clinic ID',
                  flex: 2,
                ),
                DataTitleModel(name: 'Admin', flex: 4),
                DataTitleModel(name: 'Clinic Name', flex: 4),
                DataTitleModel(name: 'Address', flex: 4),
                DataTitleModel(name: 'Phone', flex: 3),
                DataTitleModel(name: 'Email', flex: 2),
                DataTitleModel(name: '', flex: 1),
              ],
            ),
            const Divider(thickness: 3),
            Expanded(
              child: Obx(() {
                final List<Clinic> data = controller.dataMockClinic.value;
                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      const Divider(thickness: 1),
                  itemBuilder: (context, index) => Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: DataTitleWidget(
                          titles: [
                            DataTitleModel(name: data[index].clinicId, flex: 2),
                            DataTitleModel(name: data[index].staffId, flex: 4),
                            DataTitleModel(
                                name: data[index].clinicName, flex: 4),
                            DataTitleModel(name: data[index].address, flex: 4),
                            DataTitleModel(
                                name: data[index].clinicPhoneNumber, flex: 3),
                            DataTitleModel(name: data[index].email, flex: 2),
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
