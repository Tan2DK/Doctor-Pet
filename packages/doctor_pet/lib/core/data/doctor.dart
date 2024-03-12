class doctor {
  String idCustomer;
  String nameCustomer;
  String email;
  DateTime day;
  String phoneNum;
  bool accepted;

  doctor({
    required this.day,
    required this.idCustomer,
    required this.nameCustomer,
    required this.email,
    required this.phoneNum,
    this.accepted = false,
  });
}
