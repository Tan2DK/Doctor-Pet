import 'package:flutter/material.dart';
import 'package:get/get.dart'; // Ensure you need this for other GetX features
import 'package:doctor_pet/core/data/medicine.dart';
import 'package:doctor_pet/views/doctor/doctor_medicine/widgets/medicine_row.dart';

class AddMedicineDialog extends StatelessWidget {
  final List<Medicine> medicines;
  // Changed from Rx<List<Medicine>>
  final Function(Medicine, int, String) addSelectedMedicine;

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
        medicines: medicines, // No change needed here since it now matches type
      ));
    }

    // Initialize with one row
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
                  medicines.length > i ? medicines[i] : null;
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
            if (hasAdded) {
              Get.back(); // Close the dialog
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('The medicine has been successfully added!'),
                  backgroundColor: Colors.green,
                ),
              );
            } else {
              Get.back(); // Close the dialog even if nothing was added
            }
          },
          child: const Text('Save'),
        ),
      ],
    );
  }
}
