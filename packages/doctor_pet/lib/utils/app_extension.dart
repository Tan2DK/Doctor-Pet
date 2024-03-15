import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

extension DateTimeX on DateTime {
  String formatDateTime(String format) {
    return DateFormat(format).format(this);
  }
}

class TimeSlot {
  TimeOfDay? start;
  TimeOfDay? end;

  TimeSlot({this.start, this.end});
}
