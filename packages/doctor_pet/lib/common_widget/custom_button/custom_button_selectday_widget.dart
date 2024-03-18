import 'package:flutter/material.dart';

class CustomButtonSelectDayWidget extends StatelessWidget {
  const CustomButtonSelectDayWidget({
    Key? key,
    required this.label,
    this.bgColor,
    this.btnColor,
  }) : super(key: key);

  final String label;
  final Color? bgColor;
  final Color? btnColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: const Icon(Icons.calendar_month_outlined, color: Colors.white),
        style: ElevatedButton.styleFrom(
          backgroundColor: bgColor,
        ),
        onPressed: () {
          showDatePicker(
              context: context,
              firstDate: (DateTime(1900, 1, 1)),
              lastDate: DateTime.now());
        },
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ));
  }
}
