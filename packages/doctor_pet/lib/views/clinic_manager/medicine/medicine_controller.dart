import 'package:doctor_pet/core/data/medicine.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:doctor_pet/data/datamock/data_mock_medicine.dart';

class MedicineController extends GetxController {
  Rx<List<medicine>> dataMockMedicine = Rx<List<medicine>>([]);

  Rx<String> mediName = Rx<String>('');
  Rx<String> mediCompanyName = Rx<String>('');
  Rx<String> quantity = Rx<String>('');
  Rx<DateTime> importDate = Rx<DateTime>(DateTime.now());
  Rx<DateTime> expirationDate = Rx<DateTime>(DateTime.now());
  Rx<String> price = Rx<String>('');

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

  @override
  void onInit() {
    dataMockMedicine.value = mockMedicine;
  }

  void selectImportDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
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
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      expirationDate.value = picked; // Saves the selected date
    }
    expirationDate.refresh();
  }

  void showEditMedicineDialog(BuildContext context, medicine medicine) {
    importDate.value = medicine.importDate;
    expirationDate.value = medicine.expirationDate;
    Get.dialog(AlertDialog(
      title: Text('Edit Medicine'),
      content: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // SizedBox(height: 10),
              // TextField(
              //   keyboardType: TextInputType.text,
              //   controller: TextEditingController(
              //     text: medicine.idMedicine,
              //   ),
              //   style: TextStyle(fontSize: 15),
              //   decoration: InputDecoration(
              //       labelText: 'ID',
              //       border: OutlineInputBorder(
              //           borderRadius: BorderRadius.circular(10))),
              // ),
              // SizedBox(height: 10),
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
              Obx(
                () => TextField(
                  keyboardType: TextInputType.text,
                  controller: TextEditingController(
                    text: importDate.value.toString().substring(0, 10),
                  ),
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          size: 15,
                        ),
                        onPressed: () {
                          selectImportDate(context);
                        },
                      ),
                      labelText: 'Import Date',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              SizedBox(height: 10),
              Obx(
                () => TextField(
                  keyboardType: TextInputType.text,
                  controller: TextEditingController(
                    text: expirationDate.value.toString().substring(0, 10),
                  ),
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.calendar_today,
                          size: 15,
                        ),
                        onPressed: () {
                          selectExpirationDate(context);
                        },
                      ),
                      labelText: 'Expiration Day',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
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
            Navigator.of(context).pop();
          },
          child: Text('Save'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    ));
  }

  void showDeleteMedicineDialog(BuildContext context, medicine medicine) {
    Get.dialog(AlertDialog(
      icon: Icon(
        Icons.delete,
        color: Colors.red,
      ),
      title: Text('Delete Medicine'),
      content: Text('Do you want to DELETE this medicine?'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            dataMockMedicine.value.remove(medicine);
            dataMockMedicine.refresh();
            Navigator.of(context).pop();
          },
          child: Text('Yes'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('No'),
        ),
      ],
    ));
  }

  void showAddMedicineDialog(BuildContext context) {
    DateTime dateTime = DateTime(2024);
    Get.dialog(AlertDialog(
      title: Text('Add Medicine'),
      content: Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
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
            Obx(
              () => TextField(
                keyboardType: TextInputType.text,
                controller: TextEditingController(
                  text: importDate.value.toString().substring(0, 10),
                ),
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.calendar_today,
                        size: 15,
                      ),
                      onPressed: () {
                        selectImportDate(context);
                      },
                    ),
                    labelText: 'Import Date',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            SizedBox(height: 10),
            Obx(
              () => TextField(
                keyboardType: TextInputType.text,
                controller: TextEditingController(
                  text: expirationDate.value.toString().substring(0, 10),
                ),
                style: TextStyle(fontSize: 15),
                decoration: InputDecoration(
                    suffixIcon: IconButton(
                      icon: Icon(
                        Icons.calendar_today,
                        size: 15,
                      ),
                      onPressed: () {
                        selectExpirationDate(context);
                      },
                    ),
                    labelText: 'Expiration Day',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
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
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            dataMockMedicine.value.add(medicine(
                idMedicine: 'a',
                nameMedicine: mediName.value,
                companyMedicineName: mediCompanyName.value,
                quantity: quantity.value,
                importDate: importDate.value,
                expirationDate: expirationDate.value,
                price: price.value));
            dataMockMedicine.refresh();
            Navigator.of(context).pop();
          },
          child: Text('Add'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
      ],
    ));
  }
}
