class Doctor{
  String? id;
  String name;
  String address;
  String phone;
  String specialized;
  
  

  Doctor({this.id,required this.name,required this.address, required this.phone, required this.specialized});

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      id:json['doctorId'],
      name: json['doctorName'],
      address: json['address'],
      phone: json['phoneNumber'],
      specialized: json['specialized'],
    );
  }
  
  Map<String, dynamic> toJson() {
  return {
    'doctorId': id,
    'doctorName': name,
    'address': address,
    'phoneNumber': phone,
    'specialized': specialized,
  };

  
}
}
