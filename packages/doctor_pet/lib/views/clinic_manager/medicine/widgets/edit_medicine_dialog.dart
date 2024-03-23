import 'package:flutter/material.dart';
import 'package:doctor_pet/core/data/medicine.dart';
import 'package:doctor_pet/utils/app_extension.dart';
import 'package:get/get.dart';
import '../../../../common_widget/custom_text/custom_text_widget.dart';

class EditMedicineDialog extends StatefulWidget {
  const EditMedicineDialog({
    Key? key,
    this.medicine,
    this.selectDate,
    this.onAddEditMedicine,
  }) : super(key: key);

  final Medicine? medicine;
  final Function(BuildContext, DateTime, bool)? selectDate;
  final Function(Medicine)? onAddEditMedicine;

  @override
  State<EditMedicineDialog> createState() => _EditMedicineDialogState();
}

class _EditMedicineDialogState extends State<EditMedicineDialog> {
  final TextEditingController textControllerName = TextEditingController();
  final TextEditingController textControllerCompanyMedicineName =
      TextEditingController();
  final TextEditingController textControllerQuantity = TextEditingController();
  final TextEditingController textControllerPrice = TextEditingController();
  DateTime importDate = DateTime.now();
  DateTime expirationDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    textControllerName.text = widget.medicine?.nameMedicine ?? '';
    textControllerCompanyMedicineName.text =
        widget.medicine?.companyMedicineName ?? '';
    textControllerQuantity.text = widget.medicine?.quantity ?? '';
    textControllerPrice.text = widget.medicine?.price ?? '';
    importDate = widget.medicine?.importDate ?? DateTime.now();
    expirationDate = widget.medicine?.expirationDate ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: CustomTextWidget(
        text: '${widget.medicine != null ? 'Edit' : 'Add'}Medicine',
        fontWeight: FontWeight.bold,
      ),
      content: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                keyboardType: TextInputType.text,
                controller: textControllerName,
                style: const TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.text,
                controller: textControllerCompanyMedicineName,
                style: const TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: 'Company Medicine Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.text,
                controller: textControllerQuantity,
                style: const TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: 'Quantity',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 10),
              TextField(
                keyboardType: TextInputType.text,
                controller: textControllerPrice,
                style: const TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black, // Border color
                    width: 0.5, // Border width
                  ),
                  borderRadius: BorderRadius.circular(
                      8.0), // Optional: for rounded corners
                ),
                padding: const EdgeInsets.all(8.0), // Opt
                child: Row(
                  children: [
                    const Expanded(
                      child: CustomTextWidget(
                        text: 'Import Date: ',
                      ),
                    ),
                    TextButton.icon(
                        icon: const Icon(Icons.calendar_month_outlined,
                            color: Colors.black54),
                        onPressed: () async {
                          final picked = await widget.selectDate?.call(
                            context,
                            importDate,
                            true,
                          );
                          if (picked == null) return;
                          setState(() {
                            importDate = picked;
                          });
                        },
                        label: CustomTextWidget(
                          text: importDate.formatDateTime('dd-MM-yyyy'),
                          txtColor: Colors.black,
                        )),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 0.5, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: const EdgeInsets.all(8.0), // Opt
                child: Row(
                  children: [
                    const Expanded(
                      child: CustomTextWidget(
                        text: 'Expiration Date: ',
                      ),
                    ),
                    TextButton.icon(
                        icon: const Icon(Icons.calendar_month_outlined,
                            color: Colors.black54),
                        onPressed: () async {
                          final picked = await widget.selectDate?.call(
                            context,
                            expirationDate,
                            false,
                          );
                          if (picked == null) return;
                          setState(() {
                            expirationDate = picked;
                          });
                        },
                        label: CustomTextWidget(
                          text: expirationDate.formatDateTime('dd-MM-yyyy'),
                          txtColor: Colors.black,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () => widget.onAddEditMedicine?.call(
            Medicine(
              idMedicine: widget.medicine?.idMedicine ?? '',
              nameMedicine: textControllerName.text,
              companyMedicineName: textControllerCompanyMedicineName.text,
              quantity: textControllerQuantity.text,
              importDate: importDate,
              expirationDate: expirationDate,
              price: textControllerPrice.text,
            ),
          ),
          child: CustomTextWidget(
            text: widget.medicine != null ? 'Edit' : 'Add',
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
