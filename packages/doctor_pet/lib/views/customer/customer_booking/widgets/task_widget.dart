import 'package:flutter/material.dart';

class TaskWidget extends StatelessWidget {
  const TaskWidget({
    Key? key,
    required this.child,
    required this.color,
    required this.title,
    this.size = 30,
  }) : super(key: key);
  final Widget child;
  final Color color;
  final String title;
  final double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: child,
      ),
    );
  }
}
