import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProgressLineWidget extends StatelessWidget {
  const ProgressLineWidget({
    Key? key,
    this.lineLength = 30,
    this.thickness = 10,
    required this.color,
    this.front = false,
  }) : super(key: key);

  final double lineLength;
  final double thickness;
  final Color color;
  final bool front;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: lineLength,
      height: thickness,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            bottom: 0,
            left: front ? 0 : -.5,
            right: front ? -.5 : 0,
            child: ColoredBox(color: color),
          ),
        ],
      ),
    );
  }
}
