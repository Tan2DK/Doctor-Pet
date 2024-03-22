import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:doctor_pet/core/data/invoice.dart';
import 'package:doctor_pet/utils/app_assets.dart';
import 'package:doctor_pet/views/doctor/doctor_invoice/widgets/order_widget.dart';
import 'package:doctor_pet/views/doctor/doctor_invoice/widgets/issued_widget.dart';
import 'package:doctor_pet/views/doctor/doctor_invoice/widgets/text_key_widget.dart';
import 'package:doctor_pet/views/doctor/doctor_invoice/widgets/text_value_widget.dart';

class CareWidget extends StatelessWidget {
  final List<Invoice> invoices;

  const CareWidget({Key? key, required this.invoices}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                AppImages.dCareLogo,
                width: 200,
                height: 100,
              ),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  OrderWidget(),
                  IssuedWidget(),
                ],
              )
            ],
          ),
          const SizedBox(height: 15),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextValueWidget(
                      text:
                          "Dr. Darren Elder\n806 Twin Willow Lane, Old Forge,\nNewyork, USA",
                      textAlign: TextAlign.start),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Quantity",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Note Doctor",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Date",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "Total",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 5),
          ...invoices.map((invoice) => Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: TextValueWidget(
                          text: invoice.nameMedicine,
                          textAlign: TextAlign.start),
                    ),
                    const Expanded(
                      flex: 2,
                      child:
                          TextValueWidget(text: "1", textAlign: TextAlign.end),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextValueWidget(
                          text: invoice.noteDoctor, textAlign: TextAlign.end),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextValueWidget(
                          text: DateFormat('dd/MM/yyyy').format(invoice.date),
                          textAlign: TextAlign.end),
                    ),
                    Expanded(
                      flex: 2,
                      child: TextValueWidget(
                          text: "\$${invoice.totals}",
                          textAlign: TextAlign.end),
                    ),
                  ],
                ),
              )),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 5),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 6, child: SizedBox()), // This is just for spacing
                Expanded(
                  flex: 2,
                  child: Text(
                    "Total Amount:",
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Text(
                    "\$315", // Replace with actual total
                    textAlign: TextAlign.end,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const TextKeyWidget(
              text: "Other information", textAlign: TextAlign.start),
          const SizedBox(height: 10),
          const TextValueWidget(
            text:
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed dictum ligula, cursus blandit risus.",
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
