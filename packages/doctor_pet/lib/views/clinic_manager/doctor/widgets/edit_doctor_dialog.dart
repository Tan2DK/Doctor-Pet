import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widget/custom_text/custom_text_widget.dart';
import '../../../../core/data/doctor.dart';

class EditDoctorDialog extends StatefulWidget {
  const EditDoctorDialog({
    Key? key,
    this.doctor,
    this.index,
    this.onChangedStatus,
    this.addEditDoctor,
  }) : super(key: key);
  final Doctor? doctor;
  final int? index;
  final Function(bool?)? onChangedStatus;
  final Function(Doctor, int?)? addEditDoctor;

  @override
  State<EditDoctorDialog> createState() => _EditDoctorDialogState();
}

class _EditDoctorDialogState extends State<EditDoctorDialog> {
  bool status = false;
  final textControllerDoctorId = TextEditingController();
  final textControllerName = TextEditingController();
  final textControllerAddress = TextEditingController();
  final textControllerPhone = TextEditingController();
  final textControllerClinicId = TextEditingController();
  final textControllerSpecialized = TextEditingController();
  late String doctorId;
  @override
  void initState() {
    super.initState();
    if (widget.doctor == null) {
      doctorId = Random().nextInt(1000000).toString();
      textControllerDoctorId.text = doctorId;
    } else {
      doctorId = widget.doctor!.id.toString();
      textControllerDoctorId.text = doctorId;
      textControllerName.text = widget.doctor!.name;
      textControllerAddress.text = widget.doctor!.address;
      textControllerPhone.text = widget.doctor!.phone;
      textControllerSpecialized.text = widget.doctor!.specialized;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomTextWidget(
        text: '${widget.doctor != null ? 'Edit' : 'Add'} Doctor',
        fontWeight: FontWeight.bold,
      ),
      content: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              keyboardType: TextInputType.text,
              controller: textControllerName,
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Doctor Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.text,
              controller: textControllerAddress,
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.text,
              controller: textControllerPhone,
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.text,
              controller: textControllerSpecialized,
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Specialized',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                const CustomTextWidget(
                  text: 'Status: ',
                ),
                Checkbox(
                  activeColor: Colors.green,
                  value: status,
                  onChanged: (value) {
                    setState(() {
                      status = value!;
                      widget.onChangedStatus?.call(value);
                    });
                  },
                ),
                CustomTextWidget(
                  text: status ? 'Active' : 'Inactive',
                ),
              ],
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => widget.addEditDoctor?.call(
            Doctor(
                id: doctorId,
                name: textControllerName.text,
                address: textControllerAddress.text,
                phone: textControllerPhone.text,
                specialized: textControllerSpecialized.text,
                status: status),
            widget.index,
          ),
          child: CustomTextWidget(
            text: widget.doctor != null ? 'Edit' : 'Add',
            txtColor: Colors.black,
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
