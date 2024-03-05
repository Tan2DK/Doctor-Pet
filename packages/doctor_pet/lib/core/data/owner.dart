import 'package:doctor_pet/core/data/pets.dart';

class Owner {
  String email;
  String name;
  String phone;
  Pet pet;
  Owner(
      {required this.email,
      required this.name,
      required this.phone,
      required this.pet});
}
