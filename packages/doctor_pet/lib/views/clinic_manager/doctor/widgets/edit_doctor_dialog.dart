import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widget/custom_text/custom_text_widget.dart';
import '../../../../core/data/doctor.dart';

class EditDoctorDialog extends StatefulWidget {
  const EditDoctorDialog(
      {super.key,
      this.doctor,
      this.onChangedName,
      this.onChangedAddress,
      this.onChangedPhone,
      this.onChangedDescription,
      this.onChangedStatus,
      this.addDoctor,
      required this.textControllerName,
      required this.textControllerAddress,
      required this.textControllerPhone,
      required this.textControllerDescription});
  final Doctor? doctor;
  final Function(String?)? onChangedName;
  final Function(String?)? onChangedAddress;
  final Function(String?)? onChangedPhone;
  final Function(String?)? onChangedDescription;
  final Function(bool?)? onChangedStatus;
  final Function()? addDoctor;

  final TextEditingController textControllerName;
  final TextEditingController textControllerAddress;
  final TextEditingController textControllerPhone;
  final TextEditingController textControllerDescription;

  @override
  State<EditDoctorDialog> createState() => _EditDoctorDialogState();
}

class _EditDoctorDialogState extends State<EditDoctorDialog> {
  bool status = false;

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
              onChanged: widget.onChangedName,
              keyboardType: TextInputType.text,
              controller: widget.textControllerName..text = widget.doctor?.name?? '',
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Doctor Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: widget.onChangedAddress,
              keyboardType: TextInputType.text,
              controller: widget.textControllerAddress..text = widget.doctor?.address?? '',
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Address',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: widget.onChangedPhone,
              keyboardType: TextInputType.text,
              controller: widget.textControllerPhone..text = widget.doctor?.phone?? '',
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Phone',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: widget.onChangedDescription,
              keyboardType: TextInputType.text,
              controller: widget.textControllerDescription..text = widget.doctor?.description?? '',
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Description',
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
          // onPressed: () {
          //   doctor.name = name.value.isEmpty ? doctor.name : name.value;
          //   doctor.address = address.isEmpty ? doctor.address : address.value;
          //   doctor.phone = phone.isEmpty ? doctor.phone : phone.value;
          //   doctor.status = status.value;
          //   doctor.description = description.value.isEmpty
          //       ? doctor.description
          //       : description.value;
          //   dataMockDoctor.refresh();
          //   Get.back();
          //   clearData();
          // },
          onPressed: widget.addDoctor,
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
