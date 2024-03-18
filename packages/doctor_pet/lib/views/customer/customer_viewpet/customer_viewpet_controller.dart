import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/core/data/pet.dart';
import 'package:doctor_pet/core/data/owner.dart';
import 'package:doctor_pet/data/data_mock/petslist.dart';
import 'package:intl/intl.dart';

class PetController extends GetxController {
  Rx<List<Pet>> pets = Rx<List<Pet>>([]);
  Rx<List<Pet>> filteredPets = Rx<List<Pet>>([]);

  @override
  void onInit() {
    super.onInit();
    pets.value = mockPets;
    filteredPets.value = List.from(pets.value);
  }

  void searchPet(String query) {
    if (query.isEmpty) {
      filteredPets.value = List.from(pets.value);
    } else {
      filteredPets.value = pets.value
          .where((pet) => pet.name.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
    filteredPets.refresh();
  }

  void showOwnerDetails(Owner owner) {
    Get.dialog(AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            20), // Bạn có thể điều chỉnh giá trị này để thay đổi độ cong của góc
      ),
      title: const Text(
        'Customer Information',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.deepPurple, // Thay đổi màu sắc cho tiêu đề
        ),
      ),
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
          child: const Text(
            'Close',
            style: TextStyle(color: Colors.deepPurple), // Màu sắc cho nút Close
          ),
        ),
      ],
    ));
  }
}
