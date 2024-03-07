import 'owner.dart';

class pet {
  String id;
  String name;
  String species;
  DateTime birthday;
  String origin;
  String color;
  owner own;
  pet({required this.birthday,required this.id,required this.name,required this.color,required this.origin,required this.species,required this.own});
}