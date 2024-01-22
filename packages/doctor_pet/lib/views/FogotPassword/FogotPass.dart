// main.dart
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignUpScreen(title: 'Đăng ký'),
    );
  }
}

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/img/anhnen.jpg',
            ), // Sửa đường dẫn đến ảnh nền
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Align(
            alignment: const Alignment(0.2, 0), // Đặt ô đăng ký sang phải
            child: Container(
              width: 400,
              height: 350,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(13),
                 color: const Color(0xFFF6FBF9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Identify Email',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  
                  const SizedBox(height: 16.0),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: 'Email Address',
                    ),
                  ),
                  
                  const SizedBox(height: 16.0),
                  Container(
                    width: 201.0,
                    height: 60.5,
                    child: ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                            0xFF84C7AE), 
                        padding: const EdgeInsets.symmetric(
                            vertical: 16.0), 
                      ),
                      child: const Text(
                        'Send',
                        style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Row(
                    
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      
                      Row(
                        children: [
                          
                          Text('Already Have An Account?'),
                          TextButton(
                            onPressed: () {
                              // Handle sign-up button press
                            },
                            child: Text('Sign In'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}