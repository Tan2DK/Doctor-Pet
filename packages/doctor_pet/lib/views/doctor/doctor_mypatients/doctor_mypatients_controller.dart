import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:flutter/gestures.dart';
import 'package:doctor_pet/core/data/mypatients.dart';
import 'package:doctor_pet/core/data/my_patients_details.dart';
import 'package:doctor_pet/data/data_mock/doctor_mypatients.dart';
import 'package:doctor_pet/views/doctor/doctor_mypatients/my_patients_view.dart';

class MyPatientsController extends GetxController {
  Rx<List<Patients>> myPatients = Rx<List<Patients>>([]);

  @override
  void onInit() {
    super.onInit();
    myPatients.value = mockMypatients;
  }

  void showDetails(PatientsDetails details) {
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
                            Text('Pet Name: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(details.petName),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text('Pet Age: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(details.petAge),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text('Note from Doctor: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(details.noteDoctor),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text('Diagnosis: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(details.diagnosis),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text('Pet Type ID: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(details.petTypeId),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text('Date Bought Medicine: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            Text(DateFormat('yyyy-MM-dd')
                                .format(details.dateBuyMedicine)),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text('View Invoice: ',
                                style: TextStyle(fontWeight: FontWeight.bold)),
                            RichText(
                              text: TextSpan(
                                text: 'Click Here',
                                style: TextStyle(color: Colors.blue),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    // Navigate to the invoice view
                                    Get.to(() => MyPatientsView());
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
