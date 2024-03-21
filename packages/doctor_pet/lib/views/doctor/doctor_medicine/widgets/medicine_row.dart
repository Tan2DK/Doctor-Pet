import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/core/data/medicine.dart';

class MedicineRow extends StatelessWidget {
  final TextEditingController quantityController;
  final TextEditingController noteController;
  final Rx<List<Medicine>> medicines;

  MedicineRow({
    Key? key,
    required this.quantityController,
    required this.noteController,
    required this.medicines,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Obx(() => DropdownButtonFormField<Medicine>(
                decoration: const InputDecoration(labelText: 'Medicine'),
                onChanged: (Medicine? value) {},
                items: medicines.value
                    .map<DropdownMenuItem<Medicine>>((Medicine medicine) {
                  return DropdownMenuItem<Medicine>(
                    value: medicine,
                    child: Text(medicine.nameMedicine),
                  );
                }).toList(),
              )),
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
    );
  }
}
