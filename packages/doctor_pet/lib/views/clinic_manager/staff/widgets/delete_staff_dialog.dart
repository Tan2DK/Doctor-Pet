import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widget/custom_text/custom_text_widget.dart';

class DeleteStaffDialog extends StatelessWidget {
  const DeleteStaffDialog(
      {super.key, required this.index, required this.deleteStaff});

  final int index;
  final Function(int) deleteStaff;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const CustomTextWidget(
        text: 'Delete Staff',
        fontWeight: FontWeight.bold,
      ),
      content: const Text('Do you want to DELETE this Staff?'),
      actions: <Widget>[
        TextButton(
          onPressed: () => deleteStaff(index),
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
