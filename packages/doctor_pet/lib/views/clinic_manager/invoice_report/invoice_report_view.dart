import 'package:doctor_pet/common_widget/custom_button/custom_button_selectday_widget.dart';
import 'package:doctor_pet/common_widget/custom_button/custom_button_show_widget.dart';
import 'package:doctor_pet/common_widget/custom_searchbar_widget.dart';
import 'package:doctor_pet/core/data/invoicereport.dart';
import 'package:doctor_pet/core/data/medicinereport.dart';
import 'package:doctor_pet/core/data/patient.dart';
import 'package:doctor_pet/views/clinic_manager/invoice_report/invoice_report_controller.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/core/data/pet.dart';
import 'package:doctor_pet/core/data/owner.dart';
import 'package:doctor_pet/common_widget/data_title_widget.dart';
import 'package:doctor_pet/core/data/DataTitleModel.dart';
import 'package:get/get.dart';

class InvoiceReportView extends GetView<InvoiceReportController> {
  const InvoiceReportView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List<invoicereport> dataInvoiceReport = List.from(controller.dataInvoiceReport);

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
                'Invoice Report',
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
                DataTitleModel(
                  name: 'Patient ID',
                  flex: 2,
                ),
                DataTitleModel(name: 'Patient Name', flex: 4),
                DataTitleModel(name: 'Cost', flex: 2),
                DataTitleModel(name: 'Day', flex: 5),
                DataTitleModel(name: 'Prescription', flex: 5),
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
                              name: dataInvoiceReport[index].patientID,
                              flex: 2),
                          DataTitleModel(
                              name: dataInvoiceReport[index].patientName,
                              flex: 4),
                          DataTitleModel(
                              name: dataInvoiceReport[index].cost.toString(),
                              flex: 2),
                          DataTitleModel(
                              name: dataInvoiceReport[index].day.toString().substring(0,11),
                              flex: 5),
                          DataTitleModel(
                              name: dataInvoiceReport[index].prescription,
                              flex: 5),
                        ],
                      ),
                    ),
                  ],
                ),
                itemCount: dataInvoiceReport.length,
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
