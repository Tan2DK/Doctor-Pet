import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widget/custom_text/custom_text_widget.dart';
import '../../../../core/data/medicine.dart';

class DeleteMedicineDialog extends StatelessWidget {
  const DeleteMedicineDialog({
    Key? key,
    required this.medicine,
    this.onDeleteMedicine,
  }) : super(key: key);

final Medicine medicine;
  final Function(Medicine)? onDeleteMedicine;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const CustomTextWidget(
        text: 'Delete Medicine',
        fontWeight: FontWeight.bold,
      ),
      content: const Text('Do you want to DELETE this medicine?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => onDeleteMedicine?.call(medicine),
          child: const CustomTextWidget(
            text: 'Delete',
            txtColor: Colors.red,
          ),
        ),
        TextButton(
          onPressed: Get.back,
          child: const CustomTextWidget(
            text: 'Cancel',
            txtColor: Colors.black,
          ),
        ),
      ],
    );
  }
}
