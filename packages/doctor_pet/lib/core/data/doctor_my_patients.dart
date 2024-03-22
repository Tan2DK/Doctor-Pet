class Patient {
  String customerId;
  String petName;
  String petAge;
  String petGender;
  String petColor;
  String petTypeId;
  String petSpecies;
  DateTime dateBuyMedicine;
  String noteDoctor;
  String diagnosis;
  String viewInvoice;

  Patient({
    required this.customerId,
    required this.petName,
    required this.petAge,
    required this.petGender,
    required this.petColor,
    required this.petTypeId,
    required this.petSpecies,
    required this.dateBuyMedicine,
    required this.noteDoctor,
    required this.diagnosis,
    required this.viewInvoice,
  });
}
