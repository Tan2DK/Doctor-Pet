import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/views/doctor/doctor_invoice/doctor_invoice_controller.dart';
import 'package:doctor_pet/core/data/invoice.dart';
import 'package:doctor_pet/data/data_mock/doctor_invoice.dart';
import 'package:intl/intl.dart';

class InvoiceView extends GetView<DoctorInvoiceController> {
  const InvoiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Mock data for invoices, replace with your actual data
    final List<Invoice> invoices = mockInvoice;

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 249, 249, 249),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _order(),
                  _issued(),
                ],
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textValue(
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
                Expanded(flex: 4, child: Text("Description")),
                Expanded(
                    flex: 2, child: Text("Quantity", textAlign: TextAlign.end)),
                Expanded(
                    flex: 2,
                    child: Text("Note Doctor", textAlign: TextAlign.end)),
                Expanded(
                    flex: 2, child: Text("Date", textAlign: TextAlign.end)),
                Expanded(
                    flex: 2, child: Text("Total", textAlign: TextAlign.end)),
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
                      child: _textValue(invoice.nameMedicine,
                          textAlign: TextAlign.start)),
                  Expanded(
                      flex: 2,
                      child: _textValue("1",
                          textAlign:
                              TextAlign.end)), // Assume quantity is 1 for now
                  Expanded(
                      flex: 2,
                      child: _textValue(invoice.noteDoctor,
                          textAlign: TextAlign.end)),
                  Expanded(
                      flex: 2,
                      child: _textValue(
                          DateFormat('dd/MM/yyyy').format(invoice.date),
                          textAlign: TextAlign.end)),
                  Expanded(
                      flex: 2,
                      child: _textValue("\$${invoice.totals}",
                          textAlign: TextAlign.end)),
                ],
              ),
            ),
          ],
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
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
          _textkey("Other information", textAlign: TextAlign.start),
          const SizedBox(height: 10),
          _textValue(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed dictum ligula, cursus blandit risus.",
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _order() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Order: ", style: TextStyle(fontWeight: FontWeight.bold)),
        Text("#00124"),
      ],
    );
  }

  Widget _issued() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Issued: ", style: TextStyle(fontWeight: FontWeight.bold)),
        Text("20/07/2023"),
      ],
    );
  }

  Widget _textkey(String text, {TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _textValue(String text, {TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    );
  }
}
