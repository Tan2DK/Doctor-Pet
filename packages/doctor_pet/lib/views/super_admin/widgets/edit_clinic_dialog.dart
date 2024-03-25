import 'package:doctor_pet/core/data/clinic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widget/custom_text/custom_text_widget.dart';

class EditClinicDialog extends StatefulWidget {
  const EditClinicDialog({
    Key? key,
    this.clinic,
    this.index,
    this.addEditClinic,
  }) : super(key: key);
  final Clinic? clinic;
  final int? index;
  final Function(Clinic, int?)? addEditClinic;

  @override
  State<EditClinicDialog> createState() => _EditClinicDialogState();
}

class _EditClinicDialogState extends State<EditClinicDialog> {
  final textControllerClinicName = TextEditingController();
  final textControllerAddress = TextEditingController();
  final textControllerPhone = TextEditingController();
  final textControllerEmail = TextEditingController();
  final textControllerStaffId = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.clinic == null) return;
    textControllerClinicName.text = widget.clinic!.clinicName;
    textControllerAddress.text = widget.clinic!.address;
    textControllerPhone.text = widget.clinic!.clinicPhoneNumber;
    textControllerEmail.text = widget.clinic!.email;
    textControllerStaffId.text = widget.clinic!.staffId;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomTextWidget(
        text: '${widget.clinic != null ? 'Edit' : 'Add'} Clinic',
        fontWeight: FontWeight.bold,
      ),
      content: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.text,
              controller: textControllerStaffId,
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Admin',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.text,
              controller: textControllerClinicName,
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Clinic Name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(height: 10),
            TextField(
              keyboardType: TextInputType.text,
              controller: textControllerAddress,
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.maps_home_work_outlined),
                  ),
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
              controller: textControllerEmail,
              style: const TextStyle(fontSize: 15),
              decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => widget.addEditClinic?.call(
            Clinic(
                clinicId: widget.clinic?.clinicId ?? '',
                clinicName: textControllerClinicName.text,
                address: textControllerAddress.text,
                clinicPhoneNumber: textControllerPhone.text,
                email: textControllerEmail.text,
                staffId: textControllerStaffId.text),
            widget.index,
          ),
          child: CustomTextWidget(
            text: widget.clinic != null ? 'Edit' : 'Add',
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
