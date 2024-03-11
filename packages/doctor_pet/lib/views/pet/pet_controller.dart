import 'package:get/get.dart';
import 'package:doctor_pet/core/data/pet.dart';
import 'package:doctor_pet/core/data/owner.dart';

class PetController extends GetxController {
  var pets = <Pet>[].obs;
  var filteredPets = <Pet>[].obs;

  @override
  void onInit() {
    super.onInit();
    pets.assignAll([
      Pet(
        id: '1',
        name: 'Lu',
        species: 'Dog',
        origin: 'Viet Nam',
        color: 'Yellow',
        birthday: DateTime(2017, 9, 7),
        own: Owner(
          id: '1',
          name: 'Duy',
          phone: '091637238',
          address: 'Can Tho',
          birthday: DateTime(1989, 9, 7),
        ),
      ),
      Pet(
        id: '2',
        name: 'Na',
        species: 'Cat',
        origin: 'Japan',
        color: 'Black',
        birthday: DateTime(2018, 4, 16),
        own: Owner(
          id: '2',
          name: 'Kep',
          phone: '0919028212',
          address: 'Hanoi',
          birthday: DateTime(1990, 1, 16),
        ),
      ),
      Pet(
        id: '3',
        name: 'Bao',
        species: 'Rabbit',
        origin: 'USA',
        color: 'White',
        birthday: DateTime(2019, 7, 21),
        own: Owner(
          id: '3',
          name: 'Linh',
          phone: '0923456789',
          address: 'Da Nang',
          birthday: DateTime(1992, 3, 15),
        ),
      ),
      Pet(
        id: '4',
        name: 'Max',
        species: 'Dog',
        origin: 'Australia',
        color: 'Brown',
        birthday: DateTime(2016, 12, 25),
        own: Owner(
          id: '4',
          name: 'An',
          phone: '0987654321',
          address: 'Ho Chi Minh City',
          birthday: DateTime(1990, 8, 30),
        ),
      ),
      Pet(
        id: '5',
        name: 'Leo',
        species: 'Cat',
        origin: 'Egypt',
        color: 'Golden',
        birthday: DateTime(2017, 5, 10),
        own: Owner(
          id: '5',
          name: 'Phong',
          phone: '0934567890',
          address: 'Ha Noi',
          birthday: DateTime(1988, 7, 20),
        ),
      ),
      Pet(
        id: '6',
        name: 'Kiki',
        species: 'Bird',
        origin: 'Brazil',
        color: 'Green',
        birthday: DateTime(2020, 2, 14),
        own: Owner(
          id: '6',
          name: 'Hoa',
          phone: '0945678901',
          address: 'Nha Trang',
          birthday: DateTime(1995, 4, 25),
        ),
      ),
    ]);
    filteredPets.assignAll(pets);
  }

  void searchPet(String query) {
    if (query.isEmpty) {
      filteredPets.assignAll(pets);
    } else {
      filteredPets.assignAll(
        pets
            .where(
                (pet) => pet.name.toLowerCase().contains(query.toLowerCase()))
            .toList(),
      );
    }
    filteredPets.refresh();
  }
}
