import 'package:flutter/material.dart';

enum Status { pending, approved, rejected }

class Appointment {
  String doctorName;
  DateTime date;
  Status status;
  TimeOfDay time;

  Appointment({
    required this.doctorName,
    required this.date,
    required this.time,
    this.status = Status.pending,
  });
}
