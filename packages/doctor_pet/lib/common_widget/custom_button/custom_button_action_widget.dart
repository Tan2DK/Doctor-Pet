import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButtonActionWidget extends StatefulWidget {
  const CustomButtonActionWidget({
    Key? key,
    this.label,
    this.bgColor,
    this.txtColor,
    this.iconColor,
    this.icon,
    this.onPressed,
  }) : super(key: key);

  final String? label;
  final Color? bgColor;
  final Color? txtColor;
  final Color? iconColor;
  final IconData? icon;
  final Function()? onPressed;

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
        onPressed: widget.onPressed,
        label: Text(
          widget.label.toString(),
          style: TextStyle(
            color: widget.txtColor,
          ),
        ));
  }
}
