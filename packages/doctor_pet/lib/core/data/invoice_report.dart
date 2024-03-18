class InvoiceReport {
  String patientID;
  String patientName;
  double cost;
  DateTime day;
  String prescription;

  InvoiceReport({required this.patientID, required this.patientName, required this.cost, required this.day, required this.prescription});
}