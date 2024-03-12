import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/data/pets.dart';
import '../customer/customer_controller.dart';
import '../../core/data/owner.dart';
import '../../core/data/prescription.dart';

class CustomerView extends GetView<CustomerController> {
  const CustomerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CustomerController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Information'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 254, 234, 234),
        ),
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var owner in controller.owners) ...[
                _buildOwnerCard(owner),
                _buildPetCard(owner.pet),
                const SizedBox(height: 20),
              ],
              _buildPrescriptionSection(context), // Truyền context vào đây
              const SizedBox(height: 30),
              _buildContactUsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildOwnerCard(Owner owner) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${owner.name}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('Email: ${owner.email}'),
            Text('Phone: ${owner.phone}'),
          ],
        ),
      ),
    );
  }

  Widget _buildPetCard(Pet pet) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Pet Information',
                style: TextStyle(fontWeight: FontWeight.bold)),
            Text('Name: ${pet.namePet}'),
            Text('Species: ${pet.species}'),
            Text('Alike: ${pet.alike}'),
            Text('Sex: ${pet.sex}'),
            Text('Color: ${pet.color}'),
            Text('Age: ${pet.age}'),
          ],
        ),
      ),
    );
  }

  Widget _buildPrescriptionSection(BuildContext context) {
    // Thêm tham số context vào đây
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Prescription Information',
            style: TextStyle(fontWeight: FontWeight.bold)),
        for (var prescription in controller.prescriptions) ...[
          _buildPrescriptionCard(
              prescription, context), // Truyền context vào đây
          const SizedBox(height: 20),
        ],
      ],
    );
  }

  Widget _buildPrescriptionCard(
      Prescription prescription, BuildContext context) {
    // Thêm tham số context vào đây
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Prescription Code: ${prescription.prescriptionCode}',
                style: const TextStyle(fontWeight: FontWeight.bold)),
            Text('Pet Name: ${prescription.petName}'),
            Text(
                'Examination Date: ${prescription.examinationDate.toIso8601String()}'),
            Text('Diagnosis: ${prescription.diagnosis}'),
            Text('Instructions: ${prescription.instructions}'),
            TextButton(
              onPressed: () {
                controller.showPrescriptionDetailsDialog(prescription, context);
                // Add navigation to prescription details page
              },
              child: const Text('View Details'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactUsSection() {
    return Container(
      padding: const EdgeInsets.all(8.0),
      color: Colors.blueGrey,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Contact Us',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text('Address: Đại học FPT Cần Thơ',
              style: TextStyle(color: Colors.white)),
          Text('Phone: 0907552402', style: TextStyle(color: Colors.white)),
          Text('Email: NhutNMCE160255', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
