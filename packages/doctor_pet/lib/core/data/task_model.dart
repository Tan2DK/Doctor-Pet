import 'package:flutter/material.dart';

class TaskListModel {
  TaskListModel._();
  static const List<TaskModel> taskData = [
    TaskModel(
      icon: Icons.local_hospital_outlined,
      title: 'Branch\nSelection',
    ),
    TaskModel(
      icon: Icons.calendar_month,
      title: 'Schedule\nArangement',
    ),
    TaskModel(
      icon: Icons.check_circle_outline,
      title: 'Booking\nConfirmation',
    ),
  ];
}

class TaskModel {
  final String title;
  final IconData icon;
  const TaskModel({
    required this.title,
    required this.icon,
  });
}
