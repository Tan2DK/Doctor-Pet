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

  factory Staff.fromJson(Map<String, dynamic> json) {
    return Staff(
      staffId: json['employeeId'],
      name: json['employeeName'],
      address: json['address'],
      phone: json['phoneNumber'],
      birthday: DateTime.parse(json['birthday']),
      userId: json['userId'],
      status: json['employeeStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'employeeId': staffId,
      'employeeName': name,
      'address': address,
      'phoneNumber': phone,
      'birthday': birthday.toIso8601String(),
      'userId': userId,
      'employeeStatus': status,
    };
  }
}
