import 'package:doctor_pet/common_widget/custom_button/custom_button_selectday_widget.dart';
import 'package:doctor_pet/common_widget/custom_searchbar_widget.dart';
import 'package:doctor_pet/common_widget/custom_text/custom_text_widget.dart';
import 'package:doctor_pet/core/data/invoice_report.dart';
import 'package:doctor_pet/utils/app_extension.dart';
import 'package:doctor_pet/views/clinic_manager/invoice_report/invoice_report_controller.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/common_widget/data_title_widget.dart';
import 'package:doctor_pet/core/data/data_title_model.dart';
import 'package:get/get.dart';

class InvoiceReportView extends GetView<InvoiceReportController> {
  const InvoiceReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<InvoiceReport> data = controller.dataMockInvoiceReport.value;

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
              child: CustomTextWidget(
                text: 'Invoice Report',
                fontSize: 24,
                fontWeight: FontWeight.bold,
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
                DataTitleModel(
                  name: 'Patient ID',
                  flex: 2,
                ),
                DataTitleModel(name: 'Patient Name', flex: 4),
                DataTitleModel(name: 'Cost', flex: 2),
                DataTitleModel(name: 'Day', flex: 4),
                DataTitleModel(name: 'Prescription', flex: 5),
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
                          DataTitleModel(name: data[index].patientID, flex: 2),
                          DataTitleModel(
                              name: data[index].patientName, flex: 4),
                          DataTitleModel(
                              name: data[index].cost.toString(), flex: 2),
                          DataTitleModel(
                              name: data[index]
                                  .day
                                  .formatDateTime('dd-MM-yyyy')
                                  .toString()
                                  .substring(0, 10),
                              flex: 4),
                          DataTitleModel(
                              name: data[index].prescription, flex: 5),
                        ],
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
