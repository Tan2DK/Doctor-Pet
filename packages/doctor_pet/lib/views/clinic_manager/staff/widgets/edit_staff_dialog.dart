import 'package:doctor_pet/core/data/staff.dart';
import 'package:doctor_pet/utils/app_extension.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../common_widget/custom_text/custom_text_widget.dart';

class EditStaffDialog extends StatefulWidget {
  const EditStaffDialog({
    Key? key,
    this.staff,
    this.index,
    this.onChangedStatus,
    this.addEditStaff,
    this.selectDate,
  }) : super(key: key);

  final Staff? staff;
  final int? index;
  final Function(bool?)? onChangedStatus;
  final Function(Staff, int?)? addEditStaff;
  final Function(BuildContext, DateTime, bool)? selectDate;

  @override
  State<EditStaffDialog> createState() => _EditStaffDialogState();
}

class _EditStaffDialogState extends State<EditStaffDialog> {
  bool status = false;

  final textControllerName = TextEditingController();
  final textControllerAddress = TextEditingController();
  final textControllerPhone = TextEditingController();
  final textControllerDescription = TextEditingController();
  DateTime birthDay = DateTime.now();

  @override
  void initState() {
    super.initState();
    if (widget.staff == null) return;
    textControllerName.text = widget.staff!.name;
    textControllerAddress.text = widget.staff!.address;
    textControllerPhone.text = widget.staff!.phone;
    status = widget.staff!.status;
    birthDay = widget.staff?.birthday ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomTextWidget(
        text: '${widget.staff != null ? 'Edit' : 'Add'} Staff',
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
                  labelText: 'Staff Name',
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
            Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black,
                  width: 0.5,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const CustomTextWidget(
                    text: 'Birthday: ',
                  ),
                  TextButton.icon(
                      icon: const Icon(Icons.calendar_month_outlined,
                          color: Colors.black54),
                      onPressed: () async {
                        final picked = await widget.selectDate?.call(
                          context,
                          birthDay,
                          true,
                        );
                        if (picked == null) return;
                        setState(() {
                          birthDay = picked;
                        });
                      },
                      label: CustomTextWidget(
                        text: birthDay.formatDateTime('dd-MM-yyyy'),
                        txtColor: Colors.black,
                      )),
                ],
              ),
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
          onPressed: () => widget.addEditStaff?.call(
            Staff(
              name: textControllerName.text,
              address: textControllerAddress.text,
              phone: textControllerPhone.text,
              status: status,
              birthday: birthDay,
            ),
            widget.index,
          ),
          child: CustomTextWidget(
            text: widget.staff != null ? 'Edit' : 'Add',
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
