import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/data/data_mock/data_customer.dart';
import '../../core/data/owner.dart';
import '../../core/data/prescription.dart'; // Import the Prescription class

class CustomerController extends GetxController {
  var owners = <Owner>[].obs;
  var prescriptions = <Prescription>[].obs; // Define a list of prescriptions

  @override
  void onInit() {
    super.onInit();
    owners.assignAll(mockOwners);
    prescriptions.assignAll(mockPrescriptions); // Load prescription data
  }

  void showPrescriptionDetailsDialog(
      Prescription prescription, BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Prescription Details: ${prescription.prescriptionCode}'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pet Name: ${prescription.petName}'),
                Text(
                    'Examination Date: ${prescription.examinationDate.toIso8601String()}'),
                Text('Diagnosis: ${prescription.diagnosis}'),
                Text('Instructions: ${prescription.instructions}'),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
