import 'package:doctor_pet/core/data/invoice.dart';

final List<Invoice> mockInvoice = [
  Invoice(
    date: DateTime(2018, 01, 10),
    dateMedicine: DateTime(2018, 01, 10),
    idMedicine: '05',
    nameMedicine: 'Ibuprofen',
    companyMedicineName: 'Pharmaco',
    expirationdate: '12/2026',
    noteDoctor: 'Take 8 per day',
    price: '10', // Giả định về giá
    totals: '80', // Tổng giả định, có thể bạn cần tính dựa trên số lượng và giá
  ),
  Invoice(
    date: DateTime(2019, 02, 15),
    dateMedicine: DateTime(2018, 01, 10),
    idMedicine: '06',
    nameMedicine: 'Acetaminophen',
    companyMedicineName: 'Medicorp',
    expirationdate: '11/2024',
    noteDoctor: 'Take 3 per day',
    price: '15',
    totals: '45',
  ),
  // Thêm các mục Invoice khác tương tự
];
