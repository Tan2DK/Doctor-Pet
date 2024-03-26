class Medicine {
  String idMedicine;
  String nameMedicine;
  // String companyMedicineName;
  String medicineUnit;
  // String quantity;
  // DateTime importDate;
  // DateTime expirationDate;
  String inventory;
  String specifications;
  String price;
  String medicineCateId;

  Medicine({
    required this.idMedicine,
    required this.nameMedicine,
    // required this.companyMedicineName,
    // required this.quantity,
    // required this.importDate,
    // required this.expirationDate,
    required this.price,
    required this.inventory,
    required this.medicineUnit,
    required this.specifications,
    required this.medicineCateId
  });

  Medicine copyWith({
    String? idMedicine,
    String? nameMedicine,
    // String? companyMedicineName,
    // String? quantity,
    // DateTime? importDate,
    // DateTime? expirationDate,
    String? price,
    String? inventory,
    String? specifications,
    String? medicineUnit,
    String? medicineCateId,
  }) {
    return Medicine(
      idMedicine: idMedicine ?? this.idMedicine,
      nameMedicine: nameMedicine ?? this.nameMedicine,
      // companyMedicineName: companyMedicineName ?? this.companyMedicineName,
      // quantity: quantity ?? this.quantity,
      // importDate: importDate ?? this.importDate,
      // expirationDate: expirationDate ?? this.expirationDate,
      price: price ?? this.price,
      inventory: inventory ?? this.inventory,
      medicineUnit: medicineUnit ?? this.medicineUnit,
      specifications: specifications ?? this.specifications,
      medicineCateId: medicineCateId ?? this.medicineCateId
    );
  }
}
