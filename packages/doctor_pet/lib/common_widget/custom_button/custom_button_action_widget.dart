import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButtonActionWidget extends StatefulWidget {
  const CustomButtonActionWidget({
    Key? key,
    this.label,
    this.bgColor,
    this.txtColor,
    this.iconColor,
    this.icon
  }) : super(key: key);

  final String? label;
  final Color? bgColor;
  final Color? txtColor;
  final Color? iconColor;
  final IconData? icon;

  @override
  State<CustomButtonActionWidget> createState() => _CustomButtonActionWidgetState();
}

class _CustomButtonActionWidgetState extends State<CustomButtonActionWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Icon(widget.icon, color: widget.iconColor),
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
            color: widget.txtColor,
          ),
        ));
  }
}
