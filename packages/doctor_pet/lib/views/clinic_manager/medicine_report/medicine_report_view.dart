import 'package:doctor_pet/common_widget/custom_button/custom_button_selectday_widget.dart';
import 'package:doctor_pet/common_widget/custom_searchbar_widget.dart';
import 'package:doctor_pet/common_widget/custom_text/custom_text_widget.dart';
import 'package:doctor_pet/core/data/medicine_report.dart';
import 'package:doctor_pet/utils/app_extension.dart';
import 'package:doctor_pet/views/clinic_manager/medicine_report/medicine_report_controller.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/common_widget/data_title_widget.dart';
import 'package:get/get.dart';

import '../../../core/data/data_title_model.dart';

class MedicineReportView extends GetView<MedicineReportController> {
  const MedicineReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<MedicineReport> data = controller.dataMockMedicineReport.value;

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
            const Center(
              child: Text(
                'Medicine Report',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButtonSelectDayWidget(
                  label: 'Select Start Day',
                  bgColor: Color.fromARGB(255, 28, 195, 142),
                ),
                SizedBox(
                  width: 50,
                ),
                CustomButtonSelectDayWidget(
                  label: 'Select End Day',
                  bgColor: Color.fromARGB(255, 189, 50, 22),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            DataTitleWidget(
              titles: [
                DataTitleModel(name: 'Medicine Name', flex: 4),
                DataTitleModel(name: 'Import Date', flex: 3),
                DataTitleModel(name: 'Expiration Date', flex: 3),
                DataTitleModel(name: 'Price', flex: 2),
                DataTitleModel(name: 'Quantity', flex: 2),
                DataTitleModel(name: 'Total Price', flex: 2),
              ],
            ),
            const Divider(thickness: 3),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) =>
                    const Divider(thickness: 1),
                itemBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: DataTitleWidget(
                        titles: [
                          DataTitleModel(
                              name: data[index].medicineName, flex: 4),
                          DataTitleModel(
                              name: data[index]
                                  .importDate
                                  .formatDateTime('dd-MM-yyyy'),
                              flex: 3),
                          DataTitleModel(
                              name: data[index]
                                  .expirationDate
                                  .formatDateTime('dd-MM-yyyy'),
                              flex: 3),
                          DataTitleModel(
                              name: data[index].unitPrice.toString(), flex: 2),
                          DataTitleModel(
                              name: data[index].quantity.toString(), flex: 2),
                          DataTitleModel(
                              name: data[index].totalPrice.toString(), flex: 2),
                        ],
                      ),
                    ),
                  ],
                ),
                itemCount: data.length,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CustomTextWidget(
                  text: 'Total due: ',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
                CustomTextWidget(
                  text: '\$100',
                ),
                SizedBox(
                  width: 150,
                )
              ],
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
