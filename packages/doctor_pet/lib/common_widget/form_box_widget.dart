import 'package:flutter/material.dart';

class FormBoxWidget extends StatelessWidget {
  const FormBoxWidget({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 450,
        minWidth: 250,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 40,
        ),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(.9),
          borderRadius: BorderRadius.circular(10),
        ),
        child: child,
      ),
    );
  }
}
