import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/core/data/medicine.dart';
import 'package:doctor_pet/data/data_mock/doctor_medicine.dart';

class DoctorMedicineController extends GetxController {
  Rx<List<Medicine>> medicines = Rx<List<Medicine>>([]);
  Rx<List<Map<String, dynamic>>> selectedMedicines =
      Rx<List<Map<String, dynamic>>>([]);

  @override
  void onInit() {
    super.onInit();
    fetchMedicines();
  }

  Future<void> fetchMedicines() async {
    await Future.delayed(const Duration(seconds: 1)); // Simulate network delay
    medicines.value =
        mockMedicines; // Assuming mockMedicines is your list of medicines
  }

  void addSelectedMedicine(Medicine medicine, int quantity, String note) {
    List<Map<String, dynamic>> updatedList = List.from(selectedMedicines.value);
    updatedList.add({
      'medicine': medicine,
      'quantity': quantity,
      'note': note,
    });
    selectedMedicines.value = updatedList;
  }

  void clearSelectedMedicines() {
    selectedMedicines.value = [];
  }

  void showAddMedicineDialog() {
    List<TextEditingController> quantityControllers = [];
    List<TextEditingController> noteControllers = [];
    List<Widget> medicineWidgets = [];

    void addMedicineRow() {
      TextEditingController quantityController = TextEditingController();
      TextEditingController noteController = TextEditingController();
      quantityControllers.add(quantityController);
      noteControllers.add(noteController);

      medicineWidgets.add(
        Row(
          children: [
            Expanded(
              child: DropdownButtonFormField<Medicine>(
                decoration: const InputDecoration(labelText: 'Medicine'),
                value: medicines.value.first,
                onChanged: (Medicine? value) {},
                items: medicines.value
                    .map<DropdownMenuItem<Medicine>>((Medicine medicine) {
                  return DropdownMenuItem<Medicine>(
                    value: medicine,
                    child: Text(medicine.medicineName),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: quantityController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Quantity'),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                controller: noteController,
                decoration: const InputDecoration(labelText: 'Note'),
              ),
            ),
          ],
        ),
      );
    }

    // Initialize the first set of input fields
    addMedicineRow();

    Get.dialog(
      AlertDialog(
        title: const Text('Add Medicine'),
        content: StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ...medicineWidgets,
                  const SizedBox(height: 20),
                  TextButton(
                    onPressed: () => setState(() => addMedicineRow()),
                    child: const Text('Add More'),
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
              for (int i = 0; i < quantityControllers.length; i++) {
                final Medicine? selectedMedicine =
                    medicines.value.length > i ? medicines.value[i] : null;
                if (selectedMedicine != null) {
                  final int quantity =
                      int.tryParse(quantityControllers[i].text) ?? 0;
                  final String note = noteControllers[i].text;
                  if (quantity > 0) {
                    addSelectedMedicine(selectedMedicine, quantity, note);
                  }
                }
              }
              Get.back(); // Close the dialog
              Get.snackbar(
                'Success', // Title
                'The medicine has been successfully saved!', // Message
                backgroundColor: Colors.green,
                snackPosition: SnackPosition.BOTTOM,
                colorText: Colors.white,
              );
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
