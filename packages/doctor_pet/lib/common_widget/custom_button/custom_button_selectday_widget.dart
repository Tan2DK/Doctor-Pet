import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CustomButtonSelectDayWidget extends StatefulWidget {
  const CustomButtonSelectDayWidget({
    Key? key,
    this.label,
    this.bgColor,
    this.btnColor,
  }) : super(key: key);

  final String? label;
  final Color? bgColor;
  final Color? btnColor;

  

  @override
  State<CustomButtonSelectDayWidget> createState() =>
      _CustomButtonSelectDayWidgetState();
}

class _CustomButtonSelectDayWidgetState extends State<CustomButtonSelectDayWidget> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: Icon(Icons.calendar_month_outlined, color: Colors.white),
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
