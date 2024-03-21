import 'package:get/get.dart';
import 'package:doctor_pet/core/data/invoice.dart';
import 'package:doctor_pet/data/data_mock/doctor_invoice.dart';

class DoctorInvoiceController extends GetxController {
  Rx<List<Invoice>> medicines = Rx<List<Invoice>>([]);
  Rx<List<Map<String, dynamic>>> selectedMedicines =
      Rx<List<Map<String, dynamic>>>([]);

  @override
  void onInit() {
    super.onInit();
    medicines.value = mockInvoice;
  }
}
