class Medicine {
  String idMedicine;
  String nameMedicine;
  String companyMedicineName;
  String quantity;
  DateTime importDate;
  DateTime expirationDate;
  String price;

  Medicine({
    required this.idMedicine,
    required this.nameMedicine,
    required this.companyMedicineName,
    required this.quantity,
    required this.importDate,
    required this.expirationDate,
    required this.price,
  });

  Medicine copyWith({
    String? idMedicine,
    String? nameMedicine,
    String? companyMedicineName,
    String? quantity,
    DateTime? importDate,
    DateTime? expirationDate,
    String? price,
  }) {
    return Medicine(
      idMedicine: idMedicine ?? this.idMedicine,
      nameMedicine: nameMedicine ?? this.nameMedicine,
      companyMedicineName: companyMedicineName ?? this.companyMedicineName,
      quantity: quantity ?? this.quantity,
      importDate: importDate ?? this.importDate,
      expirationDate: expirationDate ?? this.expirationDate,
      price: price ?? this.price,
    );
  }
}
