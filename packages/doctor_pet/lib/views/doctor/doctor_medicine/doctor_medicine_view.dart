import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:doctor_pet/views/doctor/doctor_medicine/doctor_medicine_controller.dart';
import 'package:doctor_pet/core/data/medicine.dart';
import 'package:doctor_pet/views/doctor/doctor_medicine/invoice_view.dart';

class DoctorMedicineView extends GetView<DoctorMedicineController> {
  const DoctorMedicineView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DoctorMedicineController>();
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medicine View'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              _showAddMedicineDialog(context);
            },
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 254, 234, 234),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'View Medicine Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Obx(() {
                final List<Medicine> medicines = controller.medicines.value;
                return SizedBox(
                  width: screenWidth,
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text('IDMedi')),
                      DataColumn(label: Text('Name')),
                      DataColumn(label: Text('Company Medicine Name')),
                      DataColumn(label: Text('Date')),
                      DataColumn(label: Text('Expiration Date')),
                      DataColumn(label: Text('Price')),
                    ],
                    rows: medicines.map<DataRow>((medicine) {
                      return DataRow(cells: [
                        DataCell(Text(medicine.idMedicine ?? '')),
                        DataCell(Text(medicine.nameMedicine ?? '')),
                        DataCell(Text(medicine.companyMedicineName ?? '')),
                        DataCell(Text(
                          medicine.dateMedicine != null
                              ? DateFormat('yyyy-MM-dd')
                                  .format(medicine.dateMedicine!)
                              : '',
                        )),
                        DataCell(Text(medicine.expirationdate ?? '')),
                        DataCell(Text('\$${medicine.price ?? ''}')),
                      ]);
                    }).toList(),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddMedicineDialog(BuildContext context) {
    List<Widget> medicineWidgets = [];
    List<TextEditingController> quantityControllers = [];
    List<TextEditingController> noteControllers = []; // For notes

    void _addMedicine() {
      TextEditingController quantityController = TextEditingController();
      TextEditingController noteController =
          TextEditingController(); // For the note
      quantityControllers.add(quantityController);
      noteControllers.add(noteController); // Add this for notes

      medicineWidgets.add(Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<Medicine>(
              value: controller.medicines.value.first,
              onChanged: (Medicine? value) {},
              items: controller.medicines.value
                  .map<DropdownMenuItem<Medicine>>((Medicine medicine) {
                return DropdownMenuItem<Medicine>(
                  value: medicine,
                  child: Text(medicine.nameMedicine ?? ''),
                );
              }).toList(),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Quantity',
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: TextFormField(
              controller: noteController,
              decoration: const InputDecoration(
                labelText: 'Note',
              ),
            ),
          ),
        ],
      ));
    }

    _addMedicine(); // Initialize the first set of input fields

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AlertDialog(
              title: const Text('Add Medicine'),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: medicineWidgets,
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _addMedicine();
                        });
                      },
                      child: const Text('Add More'),
                    ),
                  ],
                ),
              ),
              actions: <Widget>[
                TextButton(
                  // Trong hàm _showAddMedicineDialog, sau khi người dùng nhấn 'Save':
                  onPressed: () {
                    List<Map<String, dynamic>> medicines = [];
                    for (int i = 0; i < quantityControllers.length; i++) {
                      final quantity =
                          int.tryParse(quantityControllers[i].text) ?? 0;
                      final note = noteControllers[i].text; // Lấy giá trị note
                      if (quantity > 0) {
                        controller.addSelectedMedicine(
                          controller.medicines.value[i],
                          quantity,
                          note,
                        );
                      }
                    }
                    Navigator.of(context).pop(); // Đóng dialog
                    Get.to(() =>
                        const InvoiceView()); // Chuyển đến màn hình Invoice
                  },

                  child: const Text('Save'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Just close the dialog
                  },
                  child: const Text('Cancel'),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
