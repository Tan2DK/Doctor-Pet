import 'package:flutter/material.dart';

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({
    Key? key,
    this.text = '',
    this.fontSize,
    this.fontWeight,
    this.txtColor,
  }) : super(key: key);

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? txtColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      text.toString(),
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: txtColor,
      ),
    );
  }
}
