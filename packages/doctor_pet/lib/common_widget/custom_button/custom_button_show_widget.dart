import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButtonShowWidget extends StatefulWidget {
  const CustomButtonShowWidget({
    Key? key,
    this.label,
    this.bgColor,
    this.btnColor,
  }) : super(key: key);

  final String? label;
  final Color? bgColor;
  final Color? btnColor;

  @override
  State<CustomButtonShowWidget> createState() => _CustomButtonShowWidgetState();
}

class _CustomButtonShowWidgetState extends State<CustomButtonShowWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Icon(Icons.slideshow_outlined, color: Colors.white),
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.bgColor,
        ),
        onPressed: () {
          showDatePicker(
              context: context,
              firstDate: (DateTime(1900, 1, 1)),
              lastDate: (DateTime(2500, 12, 31)));
        },
        label: Text(
          widget.label.toString(),
          style: TextStyle(
            color: Colors.white,
          ),
        ));
  }
}
