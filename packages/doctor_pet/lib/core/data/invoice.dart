class Invoice {
  String idMedicine;
  String nameMedicine;
  String companyMedicineName;
  DateTime date;
  DateTime dateMedicine;
  String expirationdate;
  String noteDoctor;
  String totals;
  String price;

  Invoice(
      {required this.idMedicine,
      required this.nameMedicine,
      required this.companyMedicineName,
      required this.date,
      required this.dateMedicine,
      required this.expirationdate,
      required this.noteDoctor,
      required this.price,
      required this.totals});
}
