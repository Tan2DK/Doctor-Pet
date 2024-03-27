class Staff {
  String staffId;
  String name;
  String address;
  String phone;
  bool status;
  DateTime birthday;
  String userId;

  Staff(
      {required this.name,
      required this.address,
      required this.phone,
      required this.status,
      required this.birthday,
      required this.staffId,
      required this.userId});

  Staff copyWith({
    String? staffId,
    String? name,
    String? address,
    String? phone,
    bool? status,
    DateTime? birthday,
    String? userId,
  }) {
    return Staff(
      staffId: staffId ?? this.staffId,
      name: name ?? this.name,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      status: status ?? this.status,
      birthday: birthday ?? this.birthday,
      userId: userId ?? this.userId,
    );
  }
}
