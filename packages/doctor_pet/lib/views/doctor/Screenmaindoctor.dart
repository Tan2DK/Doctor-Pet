import 'package:doctor_pet/views/doctor/invoice_view.dart';
import 'package:doctor_pet/views/doctor/medicine_view.dart';
import 'package:doctor_pet/views/doctor/mypatients_view.dart';
import 'package:doctor_pet/views/doctor/review_view.dart';
import 'package:doctor_pet/views/doctor/schedule_view.dart';

import 'doctor_view.dart';

import 'package:flutter/material.dart';

import '../pet/pet_view.dart';

class ScreemainDoctor extends StatefulWidget {
  const ScreemainDoctor({Key? key}) : super(key: key);

  @override
  State<ScreemainDoctor> createState() => _ScreemainDoctorState();
}

class _ScreemainDoctorState extends State<ScreemainDoctor> {
  //TODO
  int selectButton = 5;

  Widget getWidget(int init, double width, double height) {
    if (init == 1) {
      return const DoctorView();
    }

    if (init == 2) {
      return const MedicineView();
    }

    if (init == 3) {
      return const ScheduleView();
    }
    if (init == 4) {
      return const InvoiceView();
    }

    if (init == 5) {
      return const ReviewView();
    }
    if (init == 6) {
      return const MypatientsView();
    }

    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 254, 234, 234),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return WillPopScope(
      child: Scaffold(
        body: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 254, 234, 234)),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  width: screenWidth / 5,
                  decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 226, 239, 248)),
                  child: Column(
                    children: [
                      Container(
                        height: screenWidth / 40,
                        child: Row(
                          children: [
                            Container(
                              width: screenWidth / 40,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage('assets/img/dcare.png'))),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: const Text(
                                'Doctor Pet',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 5,
                      ),
                      GestureDetector(
                        child: Container(
                          height: screenHeight / 20,
                          color: (selectButton == 1)
                              ? const Color.fromARGB(255, 215, 237, 255)
                              : null,
                          child: Row(
                            children: <Widget>[
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Appointment Management',
                                    style: TextStyle(
                                        fontFamily: 'arial',
                                        fontSize: 15,
                                        color: Colors.black,
                                        fontWeight: selectButton != 1
                                            ? FontWeight.normal
                                            : FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectButton = 1;
                          });
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          height: screenHeight / 20,
                          color: (selectButton == 2)
                              ? const Color.fromARGB(255, 215, 237, 255)
                              : null,
                          child: const Stack(
                            children: <Widget>[
                              Positioned(
                                top: 15,
                                left: 20,
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Medicine',
                                          style: TextStyle(
                                            fontFamily: 'arial',
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectButton = 2;
                          });
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          height: screenHeight / 20,
                          color: (selectButton == 2)
                              ? const Color.fromARGB(255, 215, 237, 255)
                              : null,
                          child: const Stack(
                            children: <Widget>[
                              Positioned(
                                top: 15,
                                left: 20,
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Schedule Timings',
                                          style: TextStyle(
                                            fontFamily: 'arial',
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectButton = 3;
                          });
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          height: screenHeight / 20,
                          color: (selectButton == 2)
                              ? const Color.fromARGB(255, 215, 237, 255)
                              : null,
                          child: const Stack(
                            children: <Widget>[
                              Positioned(
                                top: 15,
                                left: 20,
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Invoice',
                                          style: TextStyle(
                                            fontFamily: 'arial',
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectButton = 4;
                          });
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          height: screenHeight / 20,
                          color: (selectButton == 2)
                              ? const Color.fromARGB(255, 215, 237, 255)
                              : null,
                          child: const Stack(
                            children: <Widget>[
                              Positioned(
                                top: 15,
                                left: 20,
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Review',
                                          style: TextStyle(
                                            fontFamily: 'arial',
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectButton = 5;
                          });
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          height: screenHeight / 20,
                          color: (selectButton == 2)
                              ? const Color.fromARGB(255, 215, 237, 255)
                              : null,
                          child: const Stack(
                            children: <Widget>[
                              Positioned(
                                top: 15,
                                left: 20,
                                child: Row(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'My Patients',
                                          style: TextStyle(
                                            fontFamily: 'arial',
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectButton = 6;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 0,
                bottom: 0,
                left: screenWidth / 9 + 15,
                child: Container(
                  height: screenHeight - (screenHeight / 12 + 10) - 40,
                  width: screenWidth - (screenWidth / 9 + 15) - 15,
                  child: Scaffold(
                    body: getWidget(
                        selectButton,
                        screenWidth - (screenWidth / 9 + 15) - 15,
                        screenHeight),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      onWillPop: () async {
        return false;
      },
    );
  }
}
