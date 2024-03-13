import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/views/doctor/doctor_medicine/doctor_medicine_controller.dart';
import 'package:doctor_pet/core/data/medicine.dart'; // Đảm bảo rằng bạn có đường dẫn đúng đến tệp Medicine

class InvoiceView extends GetView<DoctorMedicineController> {
  const InvoiceView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 234, 234),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Invoice View',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            _card(),
          ],
        ),
      ),
    );
  }

  Widget _card() {
    final controller = Get.find<DoctorMedicineController>(); // Lấy controller
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 50),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(2),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                "assets/img/dcare.png",
                width: 200,
                height: 100,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _order(),
                  _issued(),
                ],
              )
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _textkey("Invoice From", textAlign: TextAlign.start),
                  _textValue(
                      "Dr. Darren Elder\n806 Twin Willow Lane, Old Forge,\nNewyork, USA",
                      textAlign: TextAlign.start),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _textkey("Invoice To", textAlign: TextAlign.end),
                  _textValue(
                      "Walter Roberson\n299 Star Trek Drive, Panama City,\nFlorida, 32405, USA",
                      textAlign: TextAlign.end),
                ],
              ),
            ],
          ),
          const SizedBox(height: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textkey("Payment Method", textAlign: TextAlign.start),
              _textValue("Debit Card\nXXXXXXXXXXXX-2541\nHDFC Bank",
                  textAlign: TextAlign.start),
            ],
          ),
          const SizedBox(height: 25),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 4,
                    child: _textkey("Description", textAlign: TextAlign.start)),
                Expanded(
                    flex: 2,
                    child: _textkey("Quantity", textAlign: TextAlign.end)),
                Expanded(
                    flex: 2,
                    child: _textkey("Note Doctor", textAlign: TextAlign.end)),
                Expanded(
                    flex: 2,
                    child: _textkey("Total", textAlign: TextAlign.end)),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Divider(),
          const SizedBox(height: 5),
          Obx(() {
            return Column(
              children:
                  controller.selectedMedicines.value.map((selectedMedicine) {
                final medicine = selectedMedicine['medicine'] as Medicine;
                final quantity = selectedMedicine['quantity'];
                final note = selectedMedicine['note']; // Lấy thông tin note
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          flex: 4,
                          child: _textValue(medicine.nameMedicine ?? '',
                              textAlign: TextAlign.start)),
                      Expanded(
                          flex: 2,
                          child: _textValue("$quantity",
                              textAlign: TextAlign.end)),
                      Expanded(
                          flex: 2,
                          child:
                              _textValue(note ?? "", textAlign: TextAlign.end)),
                      Expanded(
                          flex: 2,
                          child: _textValue("\$0", textAlign: TextAlign.end)),
                    ],
                  ),
                );
              }).toList(),
            );
          }),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(flex: 6, child: SizedBox()),
                Expanded(
                  flex: 2,
                  child: _textkey(
                    "Subtotal:",
                    textAlign: TextAlign.end,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: _textValue(
                    "\$350",
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 7, child: SizedBox()),
              Expanded(flex: 3, child: Divider()),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(flex: 6, child: SizedBox()),
                Expanded(
                  flex: 2,
                  child: _textkey(
                    "Discount:",
                    textAlign: TextAlign.end,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: _textValue(
                    "-10%",
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(flex: 7, child: SizedBox()),
              Expanded(flex: 3, child: Divider()),
            ],
          ),
          const SizedBox(height: 5),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Expanded(flex: 6, child: SizedBox()),
                Expanded(
                  flex: 2,
                  child: _textkey(
                    "Total Amount:",
                    textAlign: TextAlign.end,
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: _textValue(
                    "\$315",
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          _textkey(
            "Other information",
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 10),
          _textValue(
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sed dictum ligula, cursus blandit risus. Maecenas eget metus non tellus dignissim aliquam ut a ex. Maecenas sed vehicula dui, ac suscipit lacus. Sed finibus leo vitae lorem interdum, eu scelerisque tellus fermentum. Curabitur sit amet lacinia lorem. Nullam finibus pellentesque libero.",
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _order() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _textkey(
          "Order:",
          textAlign: TextAlign.end,
        ),
        _textValue(
          "#00124",
          textAlign: TextAlign.end,
        ),
      ],
    );
  }

  Widget _issued() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        _textkey(
          "Issued:",
          textAlign: TextAlign.end,
        ),
        _textValue(
          "20/07/2023",
          textAlign: TextAlign.end,
        ),
      ],
    );
  }

  Widget _textkey(String text, {TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _textValue(String text, {TextAlign? textAlign}) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.grey.shade600,
      ),
    );
  }
}

Widget _order() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      _textkey("Order:", textAlign: TextAlign.end),
      _textValue("#00124", textAlign: TextAlign.end),
    ],
  );
}

Widget _issued() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      _textkey("Issued:", textAlign: TextAlign.end),
      _textValue("20/07/2023", textAlign: TextAlign.end),
    ],
  );
}

Widget _textkey(String text, {TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    style: const TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
  );
}

Widget _textValue(String text, {TextAlign? textAlign}) {
  return Text(
    text,
    textAlign: textAlign,
    style: const TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: Colors.grey,
    ),
  );
}
