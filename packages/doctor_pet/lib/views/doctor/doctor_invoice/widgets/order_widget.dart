// File: order_widget.dart
import 'package:flutter/material.dart';

class OrderWidget extends StatelessWidget {
  const OrderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text("Order: ", style: TextStyle(fontWeight: FontWeight.bold)),
        Text("#00124"),
      ],
    );
  }
}
