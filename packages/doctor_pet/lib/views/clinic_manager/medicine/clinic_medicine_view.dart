import 'package:doctor_pet/common_widget/custom_button/custom_button_action_widget.dart';
import 'package:doctor_pet/common_widget/custom_searchbar_widget.dart';
import 'package:doctor_pet/common_widget/custom_text/custom_text_widget.dart';
import 'package:doctor_pet/views/clinic_manager/medicine/clinic_medicine_controller.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/core/data/medicine.dart';
import 'package:doctor_pet/common_widget/data_title_widget.dart';
import 'package:get/get.dart';
import '../../../core/data/data_title_model.dart';

class ClinicMedicineView extends GetView<ClinicMedicineController> {
  const ClinicMedicineView({super.key});
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
                CustomTextWidget(
                  text: 'Medicine Management',
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
                  iconColor: Colors.black54,
                  icon: Icons.sort,
                  onPressed: () {},
                ),
                const SizedBox(width: 10),
                CustomButtonActionWidget(
                  label: 'Add Medicine',
                  bgColor: Colors.blue,
                  txtColor: Colors.white,
                  icon: Icons.add,
                  iconColor: Colors.white,
                  onPressed: () => controller.showAddEditMedicineDialog(
                    context,
                    null,
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 20),
            DataTitleWidget(
              titles: [
                DataTitleModel(name: 'IDMedi', flex: 2),
                DataTitleModel(name: 'Name', flex: 4),
                DataTitleModel(name: 'Company Medicine Name', flex: 4),
                DataTitleModel(name: 'Quantity', flex: 2),
                DataTitleModel(name: 'Import Date', flex: 4),
                DataTitleModel(name: 'Expiration Date', flex: 4),
                DataTitleModel(name: 'Price', flex: 2),
                DataTitleModel(name: '', flex: 1),
              ],
            ),
            const Divider(),
            Expanded(
              child: Obx(() {
                final List<Medicine> data = controller.dataMockMedicine.value;
                return ListView.builder(
                  itemBuilder: (context, index) => Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: DataTitleWidget(
                          titles: [
                            DataTitleModel(
                                name: data[index].idMedicine, flex: 2),
                            DataTitleModel(
                                name: data[index].nameMedicine, flex: 4),
                            DataTitleModel(
                                name: data[index].companyMedicineName, flex: 4),
                            DataTitleModel(
                                name: data[index].quantity.toString(), flex: 2),
                            DataTitleModel(
                                name: data[index]
                                    .importDate
                                    .toString()
                                    .substring(0, 10),
                                flex: 4),
                            DataTitleModel(
                                name: data[index]
                                    .expirationDate
                                    .toString()
                                    .substring(0, 10),
                                flex: 4),
                            DataTitleModel(
                                name: data[index].price.toString(), flex: 2),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 50, // Set the width of the container
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
                                controller.showAddEditMedicineDialog(
                                  context,
                                  data[index],
                                );
                                break;
                              case 'delete':
                                controller.showDeleteMedicineDialog(
                                    context, data[index]);
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
            const SizedBox(height: 100)
          ],
        ),
      ),
    );
  }
}
