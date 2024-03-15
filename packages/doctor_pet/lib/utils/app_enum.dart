enum Role {
  admin,
  clinicManager,
  doctor,
  staff,
  customer,
}

enum FixedSlot implements Comparable<FixedSlot> {
  slot1(name: '08:00 - 09:00'),
  slot2(name: '09:00 - 10:00'),
  slot3(name: '11:00 - 12:00'),
  slot4(name: '14:00 - 15:00'),
  slot5(name: '15:00 - 16:00'),
  slot6(name: '16:00 - 17:00'),
  slot7(name: '18:00 - 19:00'),
  slot8(name: '19:00 - 20:00'),
  slot9(name: '20:00 - 21:00');

  const FixedSlot({
    required this.name,
  });
  final String name;

  String get getName => name;
  @override
  int compareTo(FixedSlot other) => name.compareTo(other.name);
}

enum Weekday implements Comparable<Weekday> {
  mon(abbr: 'Mon', name: 'Monday'),
  tue(abbr: 'Tue', name: 'Tuesday'),
  wed(abbr: 'Wed', name: 'Wednesday'),
  thu(abbr: 'Thu', name: 'Thursday'),
  fri(abbr: 'Fri', name: 'Friday'),
  sat(abbr: 'Sat', name: 'Saturday'),
  sun(abbr: 'Sun', name: 'Sunday');

  final String name;
  final String abbr;

  const Weekday({required this.name, required this.abbr});

  String get getName => name;
  String get getAbbr => abbr;
  String get getNameByIndex => Weekday.values[index].name;
  String get getAbbrByIndex => Weekday.values[index].abbr;
  @override
  int compareTo(Weekday other) => name.compareTo(other.name);
}
