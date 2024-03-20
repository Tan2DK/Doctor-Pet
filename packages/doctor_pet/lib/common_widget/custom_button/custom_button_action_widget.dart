import 'package:flutter/material.dart';

class CustomButtonActionWidget extends StatelessWidget {
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
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Icon(icon, color: iconColor),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
        ),
        onPressed: onPressed,
        label: label != null
            ? Text(
                label.toString(),
                style: TextStyle(
                  color: txtColor,
                ),
              )
            : const SizedBox.shrink());
  }
}
