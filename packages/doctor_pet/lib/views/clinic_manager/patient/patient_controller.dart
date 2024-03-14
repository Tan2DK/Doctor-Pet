import 'package:doctor_pet/core/data/patient.dart';
import 'package:doctor_pet/data/datamock/data_mock_patient.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PatientController extends GetxController {
  Rx<List<patient>> dataMockPatient = Rx<List<patient>>([]);

  @override
  void onInit() {
    dataMockPatient.value = mockPatient;
  }

  void showOwnerInfoDialog(BuildContext context) {
    Get.dialog(AlertDialog(
      title: Text('Owner Information'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('ID: 1'),
          Text('Name: Nguyen Van A'),
          Text('Phone: 011223344'),
          Text('Address: Viet Nam'),
          Text('Birthday: 29/2/2002'),
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Close'),
        ),
      ],
    ));
  }

  void showPetInfoDialog(BuildContext context) {
    Get.dialog(AlertDialog(
      title: Text('Pet Information'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Pet ID: 1'),
          Text('Pet Name: Lu'),
          Text('Species: Cho Phu Quoc'),
          Text('Color: Yellow'),
          Text('Birthday: 29/2/2002'),
          Text('Origin: Viet Nam')
        ],
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop(); // Close the dialog
          },
          child: Text('Close'),
        ),
      ],
    ));
  }
}
