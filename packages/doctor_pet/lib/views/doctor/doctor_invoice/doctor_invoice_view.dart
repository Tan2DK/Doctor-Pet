import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/core/data/invoice.dart';
import 'package:doctor_pet/data/data_mock/doctor_invoice.dart';
import 'package:doctor_pet/views/doctor/doctor_invoice/widgets/card_widget.dart'; // Make sure to import CareWidget
import 'package:doctor_pet/views/doctor/doctor_invoice/doctor_invoice_controller.dart';

class DoctorInvoiceView extends GetView<DoctorInvoiceController> {
  const DoctorInvoiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Invoice> invoices = mockInvoice; // Mock data for invoices

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
            CareWidget(invoices: invoices), // Now using the new CareWidget
          ],
        ),
      ),
    );
  }
}
