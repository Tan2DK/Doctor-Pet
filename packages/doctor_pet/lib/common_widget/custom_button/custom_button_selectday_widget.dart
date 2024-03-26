import 'package:doctor_pet/common_widget/custom_text/custom_text_widget.dart';
import 'package:doctor_pet/utils/app_extension.dart';
import 'package:flutter/material.dart';

class CustomButtonSelectDayWidget extends StatefulWidget {
  const CustomButtonSelectDayWidget({
    Key? key,
    this.bgColor,
    this.btnColor,
  }) : super(key: key);

  final Color? bgColor;
  final Color? btnColor;

  @override
  State<CustomButtonSelectDayWidget> createState() =>
      _CustomButtonSelectDayWidgetState();
}

class _CustomButtonSelectDayWidgetState
    extends State<CustomButtonSelectDayWidget> {
      
  DateTime day = DateTime.now();
  Future<DateTime?> selectDate(
      BuildContext context, DateTime date, bool isLimit) async {
    return await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: DateTime(1900),
      lastDate: isLimit ? DateTime.now() : DateTime(2100),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
        icon: const Icon(Icons.calendar_month_outlined, color: Colors.white),
        style: ElevatedButton.styleFrom(
          backgroundColor: widget.bgColor,
        ),
        onPressed: () async {
          final picked = await selectDate.call(
            context,
            day,
            true,
          );
          if (picked == null) return;
          setState(() {
            day = picked;
          });
        },
        label: CustomTextWidget(
          text: day.formatDateTime('dd-MM-yyyy'),
          txtColor: Colors.white,
        ));
  }
}
