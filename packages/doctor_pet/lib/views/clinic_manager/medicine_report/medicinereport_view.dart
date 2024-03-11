import 'package:doctor_pet/common_widget/custom_button/custom_button_selectday_widget.dart';
import 'package:doctor_pet/common_widget/custom_button/custom_button_show_widget.dart';
import 'package:doctor_pet/common_widget/custom_searchbar_widget.dart';
import 'package:doctor_pet/core/data/medicinereport.dart';
import 'package:doctor_pet/views/clinic_manager/medicine_report/medicinereport_controller.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/common_widget/data_title_widget.dart';
import 'package:doctor_pet/core/data/DataTitleModel.dart';
import 'package:get/get.dart';

class MedicineReportView extends GetView<MedicineReportController> {
  const MedicineReportView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<medicinereport> dataMedicneReport = List.from(controller.dataMedicneReport);

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
            Center(
              child: Text(
                'Medicine Report',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButtonSelectDayWidget(
                  label: 'Select Start Day',
                  bgColor: Color.fromARGB(255, 28, 195, 142),
                ),
                const CustomButtonSelectDayWidget(
                  label: 'Select End Day',
                  bgColor: Color.fromARGB(255, 189, 50, 22),
                ),
                const CustomButtonShowWidget(
                  label: 'Show Report',
                  bgColor: Color.fromARGB(255, 102, 169, 228),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            DataTitleWidget(
              titles: [
                DataTitleModel(name: 'Medicine Name', flex: 4),
                DataTitleModel(name: 'Price', flex: 2),
                DataTitleModel(name: 'Quantity', flex: 2),
                DataTitleModel(name: 'Total Price', flex: 2),
              ],
            ),
            const Divider(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: DataTitleWidget(
                        titles: [
                          DataTitleModel(
                              name: dataMedicneReport[index].medicineName,
                              flex: 4),
                          DataTitleModel(
                              name:
                                  dataMedicneReport[index].unitPrice.toString(),
                              flex: 2),
                          DataTitleModel(
                              name:
                                  dataMedicneReport[index].quantity.toString(),
                              flex: 2),
                          DataTitleModel(
                              name: dataMedicneReport[index]
                                  .totalPrice
                                  .toString(),
                              flex: 2),
                        ],
                      ),
                    ),                 
                  ],
                ),
                itemCount: dataMedicneReport.length,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'Total due: ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text('\$100'),
                SizedBox(
                  width: 150,
                )
              ],
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
