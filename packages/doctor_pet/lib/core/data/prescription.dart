class Prescription {
  String prescriptionId;
  String diagnose;
  DateTime examinationDay;
  DateTime createDay;
  String reason;
  String customerId;
  String petId;
  String medicineId;
  String doctorId;

  Prescription(
      {required this.prescriptionId,
      required this.createDay,
      required this.customerId,
      required this.diagnose,
      required this.examinationDay,
      required this.medicineId,
      required this.petId,
      required this.reason,
      required this.doctorId});

  Prescription copyWith({
    String? prescriptionId,
    String? diagnose,
    DateTime? examinationDay,
    DateTime? createDay,
    String? reason,
    String? customerId,
    String? petId,
    String? medicineId,
    String? doctorId,
  }) {
    return Prescription(
      prescriptionId: prescriptionId ?? this.prescriptionId,
      diagnose: diagnose ?? this.diagnose,
      examinationDay: examinationDay ?? this.examinationDay,
      createDay: createDay ?? this.createDay,
      reason: reason ?? this.reason,
      customerId: customerId ?? this.customerId,
      petId: petId ?? this.petId,
      medicineId: medicineId ?? this.medicineId,
      doctorId: doctorId ?? this.doctorId,
    );
  }
}
