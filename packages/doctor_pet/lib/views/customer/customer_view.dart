import 'package:flutter/material.dart';
import 'package:doctor_pet/core/data/pets.dart';
import 'package:doctor_pet/core/data/owner.dart';

class Prescription {
  final String petName;
  final DateTime examinationDate;
  final String prescriptionCode;
  final String diagnosis;
  final String instructions;

  Prescription({
    required this.petName,
    required this.examinationDate,
    required this.prescriptionCode,
    required this.diagnosis,
    required this.instructions,
  });
}

class PrescriptionDetailsPage extends StatelessWidget {
  final Owner owner;
  final Prescription prescription;

  const PrescriptionDetailsPage({
    Key? key,
    required this.owner,
    required this.prescription,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prescription Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customer Name: ${owner.name}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Phone Number: ${owner.phone}'),
            Text('Pet: ${owner.pet.namePet}'),
            Text('Reason for Examination: ${prescription.instructions}'),
            Text('Diagnosis: ${prescription.diagnosis}'),
          ],
        ),
      ),
    );
  }
}

class CustomerView extends StatefulWidget {
  const CustomerView({Key? key}) : super(key: key);

  @override
  _CustomerViewState createState() => _CustomerViewState();
}

class _CustomerViewState extends State<CustomerView> {
  List<Owner> data = [
    Owner(
      email: 'nhutnmce160255@fpt.edu.vn',
      name: 'Nguyen Minh Nhut',
      phone: '0907552402',
      pet: Pet(
        idPet: '1',
        namePet: 'Lu',
        species: 'Dog',
        alike: 'Viet Nam',
        sex: 'Male',
        color: 'Yellow',
        age: '2',
        dayConsulting: DateTime(2017, 9, 7, 17, 30),
      ),
    ),
  ];

  List<Prescription> prescriptions = [
    Prescription(
      petName: 'Lu',
      examinationDate: DateTime.now(),
      prescriptionCode: 'RX123',
      diagnosis: 'Fever',
      instructions: 'Take medicine twice a day.',
    ),
  ];

  bool editingCustomerInfo = false;
  bool editingPetInfo = false;

  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController petNameController;
  late TextEditingController idPetController;
  late TextEditingController speciesController;
  late TextEditingController alikeController;
  late TextEditingController sexController;
  late TextEditingController colorController;
  late TextEditingController ageController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: data.first.name);
    emailController = TextEditingController(text: data.first.email);
    phoneController = TextEditingController(text: data.first.phone);
    petNameController = TextEditingController(text: data.first.pet.namePet);
    idPetController = TextEditingController(text: data.first.pet.idPet);
    speciesController = TextEditingController(text: data.first.pet.species);
    alikeController = TextEditingController(text: data.first.pet.alike);
    sexController = TextEditingController(text: data.first.pet.sex);
    colorController = TextEditingController(text: data.first.pet.color);
    ageController = TextEditingController(text: data.first.pet.age);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Information'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/Logo.jpg',
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'Doctor Pet',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              title: const Text('Home Page'),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Customer information'),
              onTap: () {},
            ),
          ],
        ),
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search...',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              _buildSectionTitle('Customer Information'),
              editingCustomerInfo
                  ? _buildCustomerEditForm()
                  : _buildOwnerInformation(data.first),
              _buildEditCustomerButton(),
              const SizedBox(height: 20),
              _buildSectionTitle('Pet Information'),
              editingPetInfo
                  ? _buildPetEditForm()
                  : _buildPetInformation(data.first.pet),
              _buildEditPetButton(),
              const SizedBox(height: 20),
              _buildSectionTitle('Prescription Information'),
              _buildPrescriptionInformation(),
              const SizedBox(height: 30),
              _buildContactUsSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildOwnerInformation(Owner owner) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${owner.name}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Email: ${owner.email}'),
            Text('Phone: ${owner.phone}'),
          ],
        ),
      ),
    );
  }

  Widget _buildPetInformation(Pet pet) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name: ${pet.namePet}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('ID: ${pet.idPet}'),
            Text('Species: ${pet.species}'),
            Text('Alike: ${pet.alike}'),
            Text('Sex: ${pet.sex}'),
            Text('Color: ${pet.color}'),
            Text('Age: ${pet.age}'),
            Text('Consulting Day: ${pet.dayConsulting.toString()}'),
          ],
        ),
      ),
    );
  }

  Widget _buildPrescriptionInformation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (prescriptions.isNotEmpty)
          for (int i = 0; i < prescriptions.length; i++)
            Card(
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => PrescriptionDetailsPage(
                            owner: data.first,
                            prescription: prescriptions[i],
                          ),
                        ));
                      },
                      child: Text(
                        'Prescription Code: ${prescriptions[i].prescriptionCode}',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Text('Pet Name: ${prescriptions[i].petName}'),
                    Text(
                        'Examination Date: ${prescriptions[i].examinationDate.toString()}'),
                    Text('Diagnosis: ${prescriptions[i].diagnosis}'),
                    Text('Instructions: ${prescriptions[i].instructions}'),
                  ],
                ),
              ),
            ),
      ],
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

  Widget _buildEditCustomerButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton.icon(
        onPressed: () {
          setState(() {
            editingCustomerInfo = !editingCustomerInfo;
          });
        },
        icon: const Icon(Icons.edit),
        label: const Text('Edit Customer Information'),
      ),
    );
  }

  Widget _buildEditPetButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton.icon(
        onPressed: () {
          setState(() {
            editingPetInfo = !editingPetInfo;
          });
        },
        icon: const Icon(Icons.edit),
        label: const Text('Edit Pet Information'),
      ),
    );
  }

  Widget _buildCustomerEditForm() {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      editingCustomerInfo = false;
                    });
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Save and update customer information
                    setState(() {
                      data.first.name = nameController.text;
                      data.first.email = emailController.text;
                      data.first.phone = phoneController.text;
                      editingCustomerInfo = false;
                    });
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPetEditForm() {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: petNameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: idPetController,
              decoration: const InputDecoration(labelText: 'ID'),
            ),
            TextField(
              controller: speciesController,
              decoration: const InputDecoration(labelText: 'Species'),
            ),
            TextField(
              controller: alikeController,
              decoration: const InputDecoration(labelText: 'Alike'),
            ),
            TextField(
              controller: sexController,
              decoration: const InputDecoration(labelText: 'Sex'),
            ),
            TextField(
              controller: colorController,
              decoration: const InputDecoration(labelText: 'Color'),
            ),
            TextField(
              controller: ageController,
              decoration: const InputDecoration(labelText: 'Age'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      editingPetInfo = false;
                    });
                  },
                  child: const Text('Cancel'),
                ),
                const SizedBox(width: 8),
                ElevatedButton(
                  onPressed: () {
                    // Save and update pet information
                    setState(() {
                      data.first.pet.namePet = petNameController.text;
                      data.first.pet.idPet = idPetController.text;
                      data.first.pet.species = speciesController.text;
                      data.first.pet.alike = alikeController.text;
                      data.first.pet.sex = sexController.text;
                      data.first.pet.color = colorController.text;
                      data.first.pet.age = ageController.text;
                      editingPetInfo = false;
                    });
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
