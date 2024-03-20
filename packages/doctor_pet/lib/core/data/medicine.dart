class Medicine {
  String medicineId;
  String medicineName;
  String medicineUnit;
  double prices; // Lưu ý: Dart sử dụng `double` chứ không phải `Double`
  int inventory;
  String specifications;
  String medicineCateId;

  Medicine({
    required this.medicineId,
    required this.medicineName,
    required this.medicineUnit,
    required this.prices,
    required this.inventory,
    required this.specifications,
    required this.medicineCateId,
  });
}
