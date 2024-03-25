import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:doctor_pet/core/data/pet.dart';
import 'package:doctor_pet/core/data/owner.dart';
import 'package:doctor_pet/data/data_mock/petslist.dart';

class PetController extends GetxController {
  Rx<List<Pet>> pets = Rx<List<Pet>>([]);
  Rx<List<Pet>> filteredPets = Rx<List<Pet>>([]);
  Rx<DateTime> selectedBirthday = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    pets.value = mockPets;
    filteredPets.value = List.from(pets.value);
  }

  void showOwnerDetails(Owner owner) {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      title: const Text('Customer Information',
          style:
              TextStyle(fontWeight: FontWeight.bold, color: Colors.deepPurple)),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('ID: ${owner.id}',
                style: const TextStyle(color: Colors.black54)),
            Text('Name: ${owner.name}',
                style: const TextStyle(color: Colors.black54)),
            Text('Phone: ${owner.phone}',
                style: const TextStyle(color: Colors.black54)),
            Text('Address: ${owner.address}',
                style: const TextStyle(color: Colors.black54)),
            Text(
                'Birthday: ${DateFormat('yyyy-MM-dd').format(owner.birthday)}'),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          onPressed: Get.back,
          child:
              const Text('Close', style: TextStyle(color: Colors.deepPurple)),
        ),
      ],
    ));
  }

  void addNewPet(String name, String species, String origin, String color,
      Owner owner, DateTime birthday) {
    var newPet = Pet(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      species: species,
      birthday: birthday,
      origin: origin,
      color: color,
      own: owner,
    );

    pets.value.add(newPet);
    filteredPets.value = List.from(pets.value);
    update(); // Refresh the UI

    Get.back(); // Close the dialog
    Get.snackbar('Success', 'Pet added successfully!',
        backgroundColor: Colors.green,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM);
  }

  void deletePet(String petId) {
    pets.value = pets.value.where((pet) => pet.id != petId).toList();
    filteredPets.value = List.from(pets.value);
    update(); // Refresh the UI
    Get.back(); // Đóng dialog hoặc quay lại màn hình trước

    // Trì hoãn việc hiển thị snackbar một chút để đảm bảo nó không bị ảnh hưởng bởi Get.back()
    Future.delayed(const Duration(milliseconds: 100), () {
      Get.snackbar(
        'Success',
        'Pet deleted successfully!',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    });
  }

  void editPet(
      String id, String name, String species, String origin, String color) {
    int index = pets.value.indexWhere((pet) => pet.id == id);
    if (index != -1) {
      pets.value[index].name = name;
      pets.value[index].species = species;
      pets.value[index].origin = origin;
      pets.value[index].color = color;

      filteredPets.value = List.from(pets.value);
      update(); // Refresh the UI

      Get.back(); // Close the dialog
      Get.snackbar('Success', 'Pet edited successfully!',
          backgroundColor: Colors.blue,
          colorText: Colors.white,
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void showEditPetDialog(Pet pet) {
    TextEditingController nameController =
        TextEditingController(text: pet.name);
    TextEditingController speciesController =
        TextEditingController(text: pet.species);
    TextEditingController originController =
        TextEditingController(text: pet.origin);
    TextEditingController colorController =
        TextEditingController(text: pet.color);
    // Assuming birthday editing is not required for simplicity; add if needed

    Get.dialog(AlertDialog(
      title: Text('Edit Pet - ${pet.name}'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name')),
            TextField(
                controller: speciesController,
                decoration: const InputDecoration(labelText: 'Species')),
            TextField(
                controller: originController,
                decoration: const InputDecoration(labelText: 'Origin')),
            TextField(
                controller: colorController,
                decoration: const InputDecoration(labelText: 'Color')),
            // Add more fields as necessary
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Get.back(),
        ),
        TextButton(
          child: const Text('Save'),
          onPressed: () => editPet(
              pet.id,
              nameController.text,
              speciesController.text,
              originController.text,
              colorController.text),
        ),
      ],
    ));
  }

  void showAddPetDialog() {
    TextEditingController nameController = TextEditingController();
    TextEditingController speciesController = TextEditingController();
    TextEditingController originController = TextEditingController();
    TextEditingController colorController = TextEditingController();
    Rx<DateTime?> selectedDate = Rx<DateTime?>(null);

    void selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate.value ?? DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != selectedDate.value) {
        selectedDate.value = picked;
        update(); // Notify listeners to rebuild widgets.
      }
    }

    Get.dialog(AlertDialog(
      title: const Text('Add New Pet'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                controller: nameController,
                decoration: const InputDecoration(labelText: 'Name')),
            TextField(
                controller: speciesController,
                decoration: const InputDecoration(labelText: 'Species')),
            TextField(
                controller: originController,
                decoration: const InputDecoration(labelText: 'Origin')),
            TextField(
                controller: colorController,
                decoration: const InputDecoration(labelText: 'Color')),
            GetBuilder<PetController>(
              init: this, // Initialize with the current controller
              builder: (_) {
                return ListTile(
                  title: const Text('Birthday'),
                  subtitle: Text(selectedDate.value != null
                      ? DateFormat('yyyy-MM-dd').format(selectedDate.value!)
                      : 'Select Date'),
                  trailing: const Icon(Icons.calendar_today),
                  onTap: () => selectDate(Get.context!),
                );
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          child: const Text('Cancel'),
          onPressed: () => Get.back(),
        ),
        TextButton(
          child: const Text('Add'),
          onPressed: () {
            final Owner dummyOwner = Owner(
              id: '1',
              name: 'Owner Name',
              phone: '123456789',
              address: '123 Main St',
              birthday: selectedDate.value ?? DateTime.now(),
            );
            addNewPet(
              nameController.text,
              speciesController.text,
              originController.text,
              colorController.text,
              dummyOwner,
              selectedDate.value ?? DateTime.now(),
            );
            // No need to call Get.back() here, it's called inside addNewPet
          },
        ),
      ],
    ));
  }
}
