import 'package:flutter/material.dart';
import 'package:doctor_pet/core/data/pet.dart';
import 'package:doctor_pet/core/data/owner.dart';
import 'package:doctor_pet/comon_wiget/DataTitleWidget.dart';
import 'package:doctor_pet/core/data/DataTitleModel.dart';

class PetView extends StatelessWidget {
  const PetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<pet> data = [
      pet(
        id: '1',
        name: 'Lu',
        species: 'Dog',
        origin: 'Viet Nam',
        color: 'Yellow',
        birthday: DateTime(2017, 9, 7, 17, 30),
        own: owner(
          id: '1',
          name: 'duy',
          phone: '091637238',
          address: 'can tho',
          birthday: DateTime(2021, 9, 7, 17, 30),
        ),
      ),
      pet(
        id: '2',
        name: 'Na',
        species: 'Dog',
        origin: 'Viet Nam',
        color: 'red',
        birthday: DateTime(2017, 9, 7, 17, 30),
        own: owner(
          id: '2',
          name: 'nhut kep',
          phone: '0919028212',
          address: 'can tho',
          birthday: DateTime(2021, 9, 7, 17, 30),
        ),
      ),
      pet(
        id: '3',
        name: 'Ldu',
        species: 'Dog',
        origin: 'Viet Nam',
        color: 'Yellow',
        birthday: DateTime(2017, 9, 7, 17, 30),
        own: owner(
          id: '3',
          name: 'tan huynh',
          phone: '091637238',
          address: 'can tho',
          birthday: DateTime(2021, 9, 7, 17, 30),
        ),
      ),
      pet(
        id: '4',
        name: 'popo',
        species: 'Dog',
        origin: 'Viet Nam',
        color: 'Yellow',
        birthday: DateTime(2017, 9, 7, 17, 30),
        own: owner(
          id: '4',
          name: 'vinh',
          phone: '091637238',
          address: 'can tho',
          birthday: DateTime(2021, 9, 7, 17, 30),
        ),
      ),
      
      // Add more pets as needed
    ];

    return Scaffold(
     
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 254, 234, 234),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search...',
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                'View Pet Information',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 10),
            DataTitleWidget(
              titles: [
                DataTitleModel(name: 'ID PET', flex: 1),
                DataTitleModel(name: 'Name', flex: 2),
                DataTitleModel(name: 'Species', flex: 3),
                DataTitleModel(name: 'Origin', flex: 4),
                DataTitleModel(name: 'Color', flex: 5),
                DataTitleModel(name: 'Birthday', flex: 6),
              ],
            ),
            const Divider(),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) => Row(
                  children: [
                    Expanded(
                      flex: 6,
                      child: DataTitleWidget(
                        titles: [
                          DataTitleModel(name: data[index].id, flex: 1),
                          DataTitleModel(name: data[index].name, flex: 2),
                          DataTitleModel(name: data[index].species, flex: 3),
                          DataTitleModel(name: data[index].origin, flex: 4),
                          DataTitleModel(name: data[index].color, flex: 5),
                          DataTitleModel(
                            name: data[index].birthday.toString(),
                            flex: 6,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: 100, // Set the width of the container
                      child: IconButton(
                        icon: Icon(Icons.ads_click),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Owner Information'),
                                content: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('ID: ${data[index].own.id}'),
                                    Text('Name: ${data[index].own.name}'),
                                    Text('Phone: ${data[index].own.phone}'),
                                    Text('Address: ${data[index].own.address}'),
                                    Text('Birthday: ${data[index].own.birthday}'),
                                  ],
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.of(context).pop(); // Close the dialog
                                    },
                                    child: Text('Close'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
                itemCount: data.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
