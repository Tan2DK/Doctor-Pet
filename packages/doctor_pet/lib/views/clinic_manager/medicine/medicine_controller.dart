import 'package:doctor_pet/common_widget/custom_text/custom_text_widget.dart';
import 'package:doctor_pet/core/data/medicine.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/data/data_mock/data_mock_medicine.dart';

class MedicineController extends GetxController {
  Rx<List<Medicine>> dataMockMedicine = Rx<List<Medicine>>([]);

  Rx<String> mediId = Rx<String>('');
  Rx<String> mediName = Rx<String>('');
  Rx<String> mediCompanyName = Rx<String>('');
  Rx<String> quantity = Rx<String>('');
  Rx<DateTime> importDate = Rx<DateTime>(DateTime.now());
  Rx<DateTime> expirationDate = Rx<DateTime>(DateTime.now());
  Rx<String> price = Rx<String>('');

  void onChangedMediId(String? value) {
    mediId.value = value ?? '';
  }

  void onChangedMediName(String? value) {
    mediName.value = value ?? '';
  }

  void onChangedMediCompanyName(String? value) {
    mediCompanyName.value = value ?? '';
  }

  void onChangedQuantity(String? value) {
    quantity.value = value ?? '';
  }

  void onChangedImportDate(DateTime? value) {
    importDate.value = value ?? DateTime(2024);
  }

  void onChangedExpirationDate(DateTime? value) {
    expirationDate.value = value ?? DateTime(2024);
  }

  void onChangedPrice(String? value) {
    price.value = value ?? '';
  }

  void clearData() {
    mediId.value = '';
    mediName.value = '';
    mediCompanyName.value = '';
    quantity.value = '';
    importDate.value = DateTime.now();
    expirationDate.value = DateTime.now();
    price.value = '';
  }

  @override
  void onInit() {
    super.onInit();
    dataMockMedicine.value = mockMedicine;
  }

  void selectImportDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2200),
    );
    if (picked != null) {
      importDate.value = picked; // Saves the selected date
    }
    importDate.refresh();
  }

  void selectExpirationDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2200),
    );
    if (picked != null) {
      expirationDate.value = picked; // Saves the selected date
    }
    expirationDate.refresh();
  }

  void showEditMedicineDialog(BuildContext context, Medicine medicine) {
    importDate.value = medicine.importDate;
    expirationDate.value = medicine.expirationDate;
    Get.dialog(AlertDialog(
      title: CustomTextWidget(
        text: 'Edit Medicine',
        fontWeight: FontWeight.bold,
      ),
      content: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              TextField(
                keyboardType: TextInputType.text,
                controller: TextEditingController(
                  text: medicine.idMedicine,
                ),
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: 'ID',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: onChangedMediName,
                keyboardType: TextInputType.text,
                controller: TextEditingController(
                  text: medicine.nameMedicine,
                ),
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: onChangedMediCompanyName,
                keyboardType: TextInputType.text,
                controller: TextEditingController(
                  text: medicine.companyMedicineName,
                ),
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: 'Company Medicine Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: onChangedQuantity,
                keyboardType: TextInputType.text,
                controller: TextEditingController(
                  text: medicine.quantity.toString(),
                ),
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: 'Quantity',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: onChangedPrice,
                keyboardType: TextInputType.text,
                controller: TextEditingController(
                  text: medicine.price.toString(),
                ),
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(
                height: 10,
              ),
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
                padding: EdgeInsets.all(8.0), // Opt
                child: Row(
                  children: [
                    CustomTextWidget(
                      text: 'Import Date: ',
                    ),
                    Obx(
                      () => TextButton.icon(
                          icon: Icon(Icons.calendar_month_outlined,
                              color: Colors.black54),
                          onPressed: () {
                            selectImportDate(context);
                          },
                          label: CustomTextWidget(
                            text:
                                '${importDate.value.day}-${importDate.value.month}-${importDate.value.year}',
                            txtColor: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                    width: 0.5, // Border width
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(8.0), // Opt
                child: Row(
                  children: [
                    CustomTextWidget(
                      text: 'Expiration Date: ',
                    ),
                    Obx(
                      () => TextButton.icon(
                          icon: Icon(Icons.calendar_month_outlined,
                              color: Colors.black54),
                          onPressed: () {
                            selectExpirationDate(context);
                          },
                          label: CustomTextWidget(
                            text:
                                '${expirationDate.value.day}-${expirationDate.value.month}-${expirationDate.value.year}',
                            txtColor: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            medicine.nameMedicine =
                mediName.value.isEmpty ? medicine.nameMedicine : mediName.value;
            medicine.companyMedicineName = mediCompanyName.value.isEmpty
                ? medicine.companyMedicineName
                : mediCompanyName.value;
            medicine.quantity =
                quantity.value.isEmpty ? medicine.quantity : quantity.value;
            medicine.importDate = importDate.value;
            medicine.expirationDate = expirationDate.value;
            medicine.price = price.value.isEmpty ? medicine.price : price.value;
            dataMockMedicine.refresh();

            clearData();
            Navigator.of(context).pop();
          },
          child: CustomTextWidget(
            text: 'Edit',
            txtColor: Colors.black,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: CustomTextWidget(
            text: 'Cancel',
            txtColor: Colors.black,
          ),
        ),
      ],
    ));
  }

  void showDeleteMedicineDialog(BuildContext context, Medicine medicine) {
    Get.dialog(AlertDialog(
      icon: Icon(
        Icons.delete,
        color: Colors.red,
      ),
      title: CustomTextWidget(
        text: 'Delete Medicine',
        fontWeight: FontWeight.bold,
      ),
      content: Text('Do you want to DELETE this medicine?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            dataMockMedicine.value.remove(medicine);
            dataMockMedicine.refresh();
            Navigator.of(context).pop();
          },
          child: CustomTextWidget(
            text: 'Delete',
            txtColor: Colors.red,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: CustomTextWidget(
            text: 'Cancel',
            txtColor: Colors.black,
          ),
        ),
      ],
    ));
  }

  void showAddMedicineDialog(BuildContext context) {
    Get.dialog(AlertDialog(
      title: CustomTextWidget(
        text: 'Add Medicine',
        fontWeight: FontWeight.bold,
      ),
      content: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 10,
              ),
              TextField(
                onChanged: onChangedMediId,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: 'ID',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: onChangedMediName,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: onChangedMediCompanyName,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: 'Company Medicine Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: onChangedQuantity,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: 'Quantity',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 10),
              TextField(
                onChanged: onChangedPrice,
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    labelText: 'Price',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
              SizedBox(height: 10),
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
                padding: EdgeInsets.all(
                    8.0), // Optional: for padding around the widget
                child: Row(
                  children: [
                    CustomTextWidget(
                      text: 'Import Date: ',
                    ),
                    Obx(
                      () => TextButton.icon(
                          icon: Icon(Icons.calendar_month_outlined,
                              color: Colors.black54),
                          onPressed: () {
                            selectImportDate(context);
                          },
                          label: CustomTextWidget(
                            text:
                                '${importDate.value.day}-${importDate.value.month}-${importDate.value.year}',
                            txtColor: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
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
                padding: EdgeInsets.all(8.0), //
                child: Row(
                  children: [
                    CustomTextWidget(
                      text: 'Expiration Date: ',
                    ),
                    Obx(
                      () => TextButton.icon(
                          icon: Icon(Icons.calendar_month_outlined,
                              color: Colors.black54),
                          onPressed: () {
                            selectExpirationDate(context);
                          },
                          label: CustomTextWidget(
                            text:
                                '${expirationDate.value.day}-${expirationDate.value.month}-${expirationDate.value.year}',
                            txtColor: Colors.black,
                          )),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            if (mediId.value.isEmpty ||
                mediName.value.isEmpty ||
                mediCompanyName.value.isEmpty ||
                quantity.value.isEmpty ||
                price.value.isEmpty) {
            } else {
              dataMockMedicine.value.add(Medicine(
                  idMedicine: mediId.value,
                  nameMedicine: mediName.value,
                  companyMedicineName: mediCompanyName.value,
                  quantity: quantity.value,
                  importDate: importDate.value,
                  expirationDate: expirationDate.value,
                  price: price.value));
              dataMockMedicine.refresh();
            }
            clearData();
            Navigator.of(context).pop();
          },
          child: CustomTextWidget(
            text: 'Add',
            txtColor: Colors.black,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: CustomTextWidget(
            text: 'Cancel',
            txtColor: Colors.black,
          ),
        ),
      ],
    ));
  }
}
