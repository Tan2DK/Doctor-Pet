import 'package:flutter/material.dart';

class IssuedWidget extends StatelessWidget {
  const IssuedWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Issued: ", style: TextStyle(fontWeight: FontWeight.bold)),
        Text("20/07/2023"),
      ],
    );
  }
}
