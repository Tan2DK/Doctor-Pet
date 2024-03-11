import 'package:doctor_pet/common_widget/custom_button/custom_button_action_widget.dart';
import 'package:doctor_pet/common_widget/custom_searchbar_widget.dart';
import 'package:doctor_pet/views/clinic_manager/medicine/medicine_controller.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/core/data/medicine.dart';
import 'package:doctor_pet/common_widget/data_title_widget.dart';
import 'package:doctor_pet/core/data/DataTitleModel.dart';
import 'package:get/get.dart';

class MedicineView extends GetView<MedicineController> {
  const MedicineView({super.key});
  @override
  Widget build(BuildContext context) {
    final List<medicine> data = List.from(controller.data);
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
                  'Medicine Management',
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
                const CustomButtonActionWidget(
                  label: 'Sort',
                  bgColor: Colors.blue,
                ),
                const SizedBox(width: 10),
                const CustomButtonActionWidget(
                  label: 'Add Medicine',
                  bgColor: Colors.blue,
                ),
                SizedBox(width: 10),
              ],
            ),
            SizedBox(height: 20),
            DataTitleWidget(
              titles: [
                DataTitleModel(name: 'IDMedi', flex: 2),
                DataTitleModel(name: 'Name', flex: 4),
                DataTitleModel(name: 'Medicine Name', flex: 4),
                DataTitleModel(name: 'Quantity', flex: 2),
                DataTitleModel(name: 'Date', flex: 4),
                DataTitleModel(name: 'Expiration date', flex: 4),
                DataTitleModel(name: 'Price', flex: 2),
                DataTitleModel(name: '', flex: 1),
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
                          DataTitleModel(name: data[index].idMedicine, flex: 2),
                          DataTitleModel(
                              name: data[index].nameMedicine, flex: 4),
                          DataTitleModel(
                              name: data[index].companyMedicineName, flex: 4),
                          DataTitleModel(name: data[index].quantity, flex: 2),
                          DataTitleModel(
                              name: data[index].dateMedicine.toString().substring(0,11),
                              flex: 4),
                          DataTitleModel(
                              name: data[index].expirationdate, flex: 4),
                          DataTitleModel(name: data[index].price, flex: 2),
                        ],
                      ),
                    ),
                    Container(
                      width: 50, // Set the width of the container
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
                              controller.showEditMedicineDialog(
                                  context, data[index]);
                              break;
                            case 'delete':
                              controller.showDeleteMedicineDialog(context);
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
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
