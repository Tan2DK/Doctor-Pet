import 'package:doctor_pet/common_widget/custom_button/custom_button_selectday_widget.dart';
import 'package:doctor_pet/common_widget/custom_searchbar_widget.dart';
import 'package:doctor_pet/common_widget/custom_text/custom_text_widget.dart';
import 'package:doctor_pet/core/data/prescription.dart';
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
            const SizedBox(height: 15),
            const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextWidget(
                  text: 'Start Day:',
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
                SizedBox(width: 8,),
                CustomButtonSelectDayWidget(
                  bgColor: Color.fromARGB(255, 28, 195, 142),
                ),
                SizedBox(
                  width: 30,
                ),
                CustomTextWidget(
                  text: 'End Day:',
                  fontSize: 15,
                  fontWeight: FontWeight.w800,
                ),
                SizedBox(width: 8,),
                CustomButtonSelectDayWidget(
                  bgColor: Color.fromARGB(255, 189, 50, 22),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            DataTitleWidget(
              titles: [
                DataTitleModel(name: 'Prescription ID', flex: 2),
                DataTitleModel(name: 'Patient Name', flex: 4),
                DataTitleModel(name: 'Pet Name', flex: 4),
                DataTitleModel(name: 'Day Create', flex: 3),
                DataTitleModel(name: 'Medicine', flex: 3),
              ],
            ),
            const Divider(thickness: 3),
            Expanded(child: Obx(
              () {
                final List<Prescription> data =
                    controller.dataMockPrescription.value;
                return ListView.separated(
                  separatorBuilder: (context, index) =>
                      const Divider(thickness: 1),
                  itemBuilder: (context, index) => Row(
                    children: [
                      Expanded(
                        flex: 6,
                        child: DataTitleWidget(
                          titles: [
                            DataTitleModel(
                                name: data[index].prescriptionId, flex: 2),
                            DataTitleModel(
                                name: data[index].customerId, flex: 4),
                            DataTitleModel(name: data[index].petId, flex: 4),
                            DataTitleModel(
                                name: data[index]
                                    .createDay
                                    .formatDateTime('dd-MM-yyyy'),
                                flex: 3),
                            DataTitleModel(
                                name: data[index].medicineId, flex: 3)
                          ],
                        ),
                      ),
                    ],
                  ),
                  itemCount: data.length,
                );
              },
            )),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
