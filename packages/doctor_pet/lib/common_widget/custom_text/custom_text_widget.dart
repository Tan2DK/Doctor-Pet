import 'package:flutter/material.dart';

class CustomTextWidget extends StatefulWidget {
  const CustomTextWidget({
    Key? key,
    this.text,
    this.fontSize,
    this.fontWeight,
    this.txtColor,
  }) : super(key: key);

  final String? text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? txtColor;

  @override
  State<CustomTextWidget> createState() => _CustomTextWidgetState();
}

class _CustomTextWidgetState extends State<CustomTextWidget> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text.toString(),
      style: TextStyle(
        fontSize: widget.fontSize,
        fontWeight: widget.fontWeight,
        color: widget.txtColor,
      ),
    );
  }
}
