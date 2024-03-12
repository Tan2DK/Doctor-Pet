import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/views/pet/pet_controller.dart';
import 'package:doctor_pet/core/data/pet.dart';
import 'package:doctor_pet/core/data/data_title_model.dart';
import 'package:doctor_pet/common_widget/data_title_widget.dart';

class PetView extends GetView<PetController> {
  const PetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColoredBox(
        color: const Color.fromARGB(255, 254, 234, 234),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: controller.searchPet,
                decoration: const InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'View Pet Information',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            DataTitleWidget(
              titles: [
                DataTitleModel(name: 'ID', flex: 1),
                DataTitleModel(name: 'Name', flex: 2),
                DataTitleModel(name: 'Species', flex: 3),
                DataTitleModel(name: 'Origin', flex: 4),
                DataTitleModel(name: 'Color', flex: 5),
              ],
            ),
            Expanded(
              child: Obx(() => ListView.builder(
                    itemCount: controller.filteredPets.value.length,
                    itemBuilder: (context, index) {
                      final Pet pet = controller.filteredPets.value[index];
                      return Row(
                        children: [
                          const SizedBox(width: 90), // Align with the title
                          Expanded(
                            flex: 1,
                            child: Text(pet.id),
                          ),
                          Expanded(
                            flex: 2,
                            child: Text(pet.name),
                          ),
                          Expanded(
                            flex: 3,
                            child: Text(pet.species),
                          ),
                          Expanded(
                            flex: 4,
                            child: Text(pet.origin),
                          ),
                          Expanded(
                            flex: 5,
                            child: Text(pet.color),
                          ),
                          IconButton(
                            icon: const Icon(Icons.info_outline),
                            onPressed: () =>
                                controller.showOwnerDetails(pet.own),
                          ),
                        ],
                      );
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
