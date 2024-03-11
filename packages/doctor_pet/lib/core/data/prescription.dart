class Prescription {
  final String prescriptionCode;
  final String petName;
  final DateTime examinationDate;
  final String diagnosis;
  final String instructions;

  Prescription({
    required this.prescriptionCode,
    required this.petName,
    required this.examinationDate,
    required this.diagnosis,
    required this.instructions,
  });
}
