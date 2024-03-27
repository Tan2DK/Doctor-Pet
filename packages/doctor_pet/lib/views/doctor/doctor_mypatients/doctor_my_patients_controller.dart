import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/gestures.dart';
import 'package:doctor_pet/core/data/doctor_my_patients.dart';
import 'package:doctor_pet/data/data_mock/doctor_mypatients.dart';
import 'package:doctor_pet/views/doctor/doctor_invoice/doctor_invoice_view.dart';

class MyPatientsController extends GetxController {
  Rx<List<Patient>> myPatients = Rx<List<Patient>>([]);

  @override
  void onInit() {
    super.onInit();
    myPatients.value = mockMyPatients;
  }

  void showDetails(Patient patient) {
    // Get the width of the screen
    final screenWidth = MediaQuery.of(Get.context!).size.width;
    Get.dialog(
      Dialog(
        child: FractionallySizedBox(
          widthFactor: screenWidth < 600
              ? 0.8
              : 0.5, // Adjust width factor based on screen size
          child: Padding(
            padding: const EdgeInsets.all(20.0), // Add padding for content
            child: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(minWidth: constraints.maxWidth),
                    child: Table(
                      // Adjust column widths for responsiveness
                      columnWidths: const {
                        0: IntrinsicColumnWidth(), // Use intrinsic width for labels
                        1: FlexColumnWidth(), // Allow the second column to fill the remaining space
                      },
                      children: [
                        TableRow(
                          children: [
                            const Text('Pet Name: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(patient.petName),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text('Pet Age: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(patient.petAge),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text('Note from Doctor: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(patient.noteDoctor),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text('Diagnosis: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(patient.diagnosis),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text('Pet Type ID: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(patient.petTypeId),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text('Date Bought Medicine: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(DateFormat('dd-MM-yyyy')
                                .format(patient.dateBuyMedicine)),
                          ],
                        ),
                        TableRow(
                          children: [
                            const Text('View Invoice: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            RichText(
                              text: TextSpan(
                                text: 'Click Here',
                                style: const TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigate to the invoice view
                                    Get.to(() => DoctorInvoiceView());
                                  },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
      barrierDismissible: true, // Allow dialog to be closed by tapping outside
    );
  }
}