import 'package:flutter/material.dart';

import 'package:doctor_pet/views/pet/pet_view.dart';

class Screenmain extends StatefulWidget {
  const Screenmain({Key? key}) : super(key: key);

  @override
  State<Screenmain> createState() => _ScreenmainState();
}

class _ScreenmainState extends State<Screenmain> {
  int selectButton = 1;

  Widget getWidget(int init, double width, double height) {
    if (init == 1) {}

    if (init == 2) {
      return PetView();
    }

    return Container(
      decoration: BoxDecoration(
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
          decoration: BoxDecoration(color: Color.fromARGB(255, 254, 234, 234)),
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                bottom: 0,
                child: Container(
                  width: screenWidth / 9,
                  decoration:
                      BoxDecoration(color: Color.fromARGB(255, 226, 239, 248)),
                  child: Column(
                    children: [
                      Container(
                        height: screenWidth / 40,
                        child: Row(
                          children: [
                            Container(
                              width: screenWidth / 40,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage('assets/img/dcare.png'))),
                            ),
                            Container(
                              alignment: Alignment.center,
                              child: Text(
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
                              ? Color.fromARGB(255, 215, 237, 255)
                              : null,
                          child: Row(
                            children: <Widget>[
                              const SizedBox(
                                  height:
                                      15), // Khoảng cách giữa văn bản và hình ảnh
                              Image.asset(
                                'assets/img/home.png', // Đường dẫn đến hình ảnh nhỏ
                                width: 20, // Độ rộng của hình ảnh
                                height: 20, // Độ cao của hình ảnh
                                fit: BoxFit
                                    .contain, // Hiển thị hình ảnh một cách phù hợp
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Overview',
                                    style: TextStyle(
                                        fontFamily: 'arial',
                                        fontSize: 20,
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
                              ? Color.fromARGB(255, 215, 237, 255)
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
                                          'View pet',
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
