class Invoice {
  String idMedicine;
  String nameMedicine;
  String companyMedicineName;
  DateTime dateMedicine;
  String expirationdate;
  String price;

  Invoice(
      {required this.idMedicine,
      required this.nameMedicine,
      required this.companyMedicineName,
      required this.dateMedicine,
      required this.expirationdate,
      required this.price});
}
