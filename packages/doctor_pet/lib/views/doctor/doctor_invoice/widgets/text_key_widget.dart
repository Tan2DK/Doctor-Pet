import 'package:flutter/material.dart';

class TextKeyWidget extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const TextKeyWidget({
    Key? key,
    required this.text,
    this.textAlign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
}
