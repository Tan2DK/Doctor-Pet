import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'progress_line_widget.dart';
import 'task_widget.dart';

class TaskLineWidget extends StatelessWidget {
  const TaskLineWidget({
    Key? key,
    required this.isFirst,
    required this.isLast,
    required this.thickness,
    required this.taskSize,
    required this.title,
    this.child,
    this.isNotYet = true,
  }) : super(key: key);
  final bool isFirst;
  final bool isLast;
  final double thickness;
  final double taskSize;
  final String title;
  final Widget? child;
  final bool isNotYet;

  @override
  Widget build(BuildContext context) {
    final colorStatus = isNotYet
        ? Theme.of(context).disabledColor
        : Theme.of(context).primaryColor;
    return IntrinsicWidth(
      child: Column(
        children: [
          Row(
            children: [
              if (!isFirst)
                ProgressLineWidget(
                  color: colorStatus,
                  lineLength: taskSize,
                  thickness: thickness,
                  front: true,
                ),
              TaskWidget(
                color: colorStatus,
                size: taskSize,
                title: title,
                child: child ?? const SizedBox(),
              ),
              if (!isLast)
                ProgressLineWidget(
                  color: colorStatus,
                  lineLength: taskSize,
                  thickness: thickness,
                  front: false,
                ),
            ],
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                alignment: isFirst
                    ? Alignment.centerLeft
                    : isLast
                        ? Alignment.centerRight
                        : Alignment.center,
                child: Text(
                  title,
                  textAlign: isFirst
                      ? TextAlign.left
                      : isLast
                          ? TextAlign.right
                          : TextAlign.center,
                ).paddingOnly(
                  left: isFirst ? taskSize / 7 : 1,
                  right: isLast ? taskSize / 7 : 1,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
