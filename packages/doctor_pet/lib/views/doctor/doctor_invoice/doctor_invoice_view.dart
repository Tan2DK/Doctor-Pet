import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/views/doctor/doctor_invoice/doctor_invoice_controller.dart';
import 'package:doctor_pet/core/data/invoice.dart';
import 'package:doctor_pet/data/data_mock/doctor_invoice.dart';
import 'package:intl/intl.dart';
import 'package:doctor_pet/views/doctor/doctor_invoice/widgets/order_widget.dart';
import 'package:doctor_pet/views/doctor/doctor_invoice/widgets/issued_widget.dart';
import 'package:doctor_pet/views/doctor/doctor_invoice/widgets/text_key_widget.dart';
import 'package:doctor_pet/views/doctor/doctor_invoice/widgets/text_value_widget.dart';

class DoctorInvoiceView extends GetView<DoctorInvoiceController> {
  const DoctorInvoiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock data for invoices, replace with your actual data
    final List<Invoice> invoices = mockInvoice;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Invoice View',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _card(invoices), // Pass the mock data to the card
          ],
        ),
      ),
    );
  }

  Widget _card(List<Invoice> invoices) {
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
                "assets/img/dcare.png", // Make sure you have this image in your assets
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
          for (var invoice in invoices) ...[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 4,
                    child: TextValueWidget(
                        text: invoice.nameMedicine, textAlign: TextAlign.start),
                  ),
                  const Expanded(
                    flex: 2,
                    child: TextValueWidget(text: "1", textAlign: TextAlign.end),
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
                        text: "\$${invoice.totals}", textAlign: TextAlign.end),
                  ),
                ],
              ),
            ),
          ],
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
                    child: Text("Total Amount:", textAlign: TextAlign.end)),
                Expanded(
                    flex: 2,
                    child: Text("\$315",
                        textAlign: TextAlign.end)), // Update this as needed
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
