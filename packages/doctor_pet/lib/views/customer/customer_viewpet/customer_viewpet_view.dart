import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/core/data/pet.dart';

import 'customer_viewpet_controller.dart';

class PetView extends GetView<PetController> {
  const PetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color.fromARGB(255, 254, 234, 234),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                onChanged: controller.searchPet,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  contentPadding: EdgeInsets.symmetric(vertical: 15.0),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Center(
              child: Text(
                'My Pet Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Obx(() {
              final List<Pet> pets = controller.filteredPets.value;
              return DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Species')),
                  DataColumn(label: Text('Origin')),
                  DataColumn(label: Text('Color')),
                  DataColumn(label: Text('Details')),
                ],
                rows: pets.map((pet) {
                  return DataRow(
                    cells: [
                      DataCell(Text(pet.id.toString())),
                      DataCell(Text(pet.name)),
                      DataCell(Text(pet.species)),
                      DataCell(Text(pet.origin)),
                      DataCell(Text(pet.color)),
                      DataCell(
                        IconButton(
                          icon: const Icon(Icons.info_outline),
                          onPressed: () => controller.showOwnerDetails(pet.own),
                        ),
                      ),
                    ],
                  );
                }).toList(),
              );
            }),
          ],
        ),
      ),
    );
  }
}
