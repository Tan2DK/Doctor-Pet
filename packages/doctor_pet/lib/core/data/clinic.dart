class Clinic {
  String clinicId;
  String clinicName;
  String address;
  String clinicPhoneNumber;
  String email;
  String staffId;
  Clinic(
      {required this.clinicId,
      required this.clinicName,
      required this.address,
      required this.clinicPhoneNumber,
      required this.email,
      required this.staffId});

  Clinic copyWith({
    String? clinicId,
    String? clinicName,
    String? address,
    String? clinicPhoneNumber,
    String? email,
    String? staffId,
  }) {
    return Clinic(
      clinicId: clinicId ?? this.clinicId,
      clinicName: clinicName ?? this.clinicName,
      address: address ?? this.address,
      clinicPhoneNumber: clinicPhoneNumber ?? this.clinicPhoneNumber,
      email: email ?? this.email,
      staffId: staffId ?? this.staffId,
    );
  }
}
