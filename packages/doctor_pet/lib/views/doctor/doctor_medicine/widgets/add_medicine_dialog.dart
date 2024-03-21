import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/core/data/medicine.dart';
import 'package:doctor_pet/views/doctor/doctor_medicine/widgets/medicine_row.dart';

class AddMedicineDialog extends StatelessWidget {
  final Rx<List<Medicine>> medicines;
  final Function addSelectedMedicine;

  AddMedicineDialog(
      {Key? key, required this.medicines, required this.addSelectedMedicine})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextEditingController> quantityControllers = [];
    List<TextEditingController> noteControllers = [];
    List<Widget> medicineWidgets = [];

    void addMedicineRow() {
      TextEditingController quantityController = TextEditingController();
      TextEditingController noteController = TextEditingController();
      quantityControllers.add(quantityController);
      noteControllers.add(noteController);

      medicineWidgets.add(MedicineRow(
        quantityController: quantityController,
        noteController: noteController,
        medicines: medicines,
      ));
    }

    addMedicineRow();

    return AlertDialog(
      title: const Text('Add Medicine'),
      content: StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ...medicineWidgets,
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {
                      setState(() {
                        addMedicineRow();
                      });
                    },
                    child: const Text('Add More'),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            bool hasAdded = false;
            for (int i = 0; i < quantityControllers.length; i++) {
              final Medicine? selectedMedicine =
                  medicines.value.length > i ? medicines.value[i] : null;
              if (selectedMedicine != null) {
                final int quantity =
                    int.tryParse(quantityControllers[i].text) ?? 0;
                final String note = noteControllers[i].text;
                if (quantity > 0) {
                  addSelectedMedicine(selectedMedicine, quantity, note);
                  hasAdded = true;
                }
              }
            }
            Get.back();

            if (hasAdded) {
              ScaffoldMessenger.of(context).showSnackBar(
                // ignore: prefer_const_constructors
                SnackBar(
                  content:
                      const Text('The medicine has been successfully saved!'),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior
                      .floating, // To show in the middle of the screen
                  margin: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10.0), // Adjust based on your design
                  duration: const Duration(seconds: 3),
                ),
              );
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
