import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'q&a_controller.dart';

class QandA extends GetView<QuestionAnswerController> {
  const QandA({super.key, Key? keys});

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
                // Sử dụng một hàng để chứa logo và văn bản
                crossAxisAlignment:
                    CrossAxisAlignment.center, // Căn chỉnh theo chiều ngang
                children: [
                  Image.asset(
                    'assets/Logo.jpg',
                    height: 50,
                    width: 50,
                  ),
                  const SizedBox(width: 8), // Khoảng cách giữa logo và văn bản
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
              onTap: () {
                // Update UI based on item 1
              },
            ),
            ListTile(
              title: const Text('Customer information'),
              onTap: () {
                // Update UI based on item 2
              },
            ),
            // Add more ListTiles for additional items
          ],
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 254, 234, 234),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 3,
                      offset: const Offset(0, 2), // changes position of shadow
                    ),
                  ],
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search...',
                      suffixIcon: Icon(Icons.search, color: Colors.grey),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Question and Answer',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(height: 30),
            Container(
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
                    ),
                  ),
                  SizedBox(height: 5),
                  Text('Address: Đại học FPT Cần Thơ',
                      style: TextStyle(color: Colors.white)),
                  Text('Phone: 0907552402',
                      style: TextStyle(color: Colors.white)),
                  Text('Email: NhutNMCE160255',
                      style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
