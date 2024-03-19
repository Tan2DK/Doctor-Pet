class Medicine {
  String idMedicine;
  String nameMedicine;
  String specifications;
  DateTime dateMedicine;
  DateTime expirationdate;
  String price;

  Medicine(
      {required this.idMedicine,
      required this.nameMedicine,
      required this.specifications,
      required this.dateMedicine,
      required this.expirationdate,
      required this.price});
}
