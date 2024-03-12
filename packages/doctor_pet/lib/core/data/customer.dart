import 'pets.dart';

class Customer {
  final String firstName;
  final String lastName;
  final String email;
  final String phoneNumber;
  final String dateOfBirth;
  Pet pet;
  Customer(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber,
      required this.dateOfBirth,
      required this.pet});
}
