import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/app_enum.dart';
import 'package:doctor_pet/core/data/pet.dart';
import 'package:doctor_pet/core/data/owner.dart';
import 'package:doctor_pet/views/home/nested_navigation/nested_navigation_pet.dart';
import 'package:doctor_pet/data/data_mock/petslist.dart';

class PetController extends GetxController {
  RxInt index = RxInt(0);
  Rx<Role> role = Rx<Role>(Role.customer);

  final customerTabNameList = [
    'Dashboard',
    'Appointment',
    'Medical history',
    'Ask Doctor',
    'Search Clinic',
    'Pet view',
  ];

  Rx<List<Pet>> pets = Rx<List<Pet>>([]);
  Rx<List<Pet>> filteredPets = Rx<List<Pet>>([]);

  void changeTab(int i) => index.value = i;

  List<String> getTabListByRole(Role role) {
    switch (role) {
      case Role.customer:
        return customerTabNameList;
      default:
        return [];
    }
  }

  List<Widget> listScreen() {
    return [
      const NestedNavigationPet(),
      // Add other screens corresponding to each tab here
    ];
  }

  @override
  void onInit() {
    super.onInit();
    // Use data from mockPets
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

  void showOwnerDetails(BuildContext context, Owner owner) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Owner Information'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('ID: ${owner.id}'),
                Text('Name: ${owner.name}'),
                Text('Phone: ${owner.phone}'),
                Text('Address: ${owner.address}'),
                Text('Birthday: ${owner.birthday.toString()}'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
