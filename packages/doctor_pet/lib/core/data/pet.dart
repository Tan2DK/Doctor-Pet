import 'owner.dart';

class Pet {
  // Sửa tên class
  String id;
  String name;
  String species;
  DateTime birthday;
  String origin;
  String color;
  Owner own; // Sửa kiểu dữ liệu
  Pet(
      {required this.id,
      required this.name,
      required this.species,
      required this.birthday,
      required this.origin,
      required this.color,
      required this.own});
}
