import 'package:flutter/material.dart';

class TextValueWidget extends StatelessWidget {
  final String text;
  final TextAlign? textAlign;

  const TextValueWidget({
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
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: Colors.grey,
      ),
    );
  }
}
