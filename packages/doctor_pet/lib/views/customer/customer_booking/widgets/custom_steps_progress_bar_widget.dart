import 'package:doctor_pet/core/data/task_model.dart';
import 'package:doctor_pet/views/customer/customer_booking/widgets/task_line_widget.dart';
import 'package:flutter/material.dart';

class CustomStepsProgressBarWidget extends StatelessWidget {
  const CustomStepsProgressBarWidget({
    Key? key,
    required this.taskList,
    required this.indexOfInProgress,
    this.taskSize = 30,
    this.thickness = 10,
    required this.lineLength,
  }) : super(key: key);
  final List<TaskModel> taskList;
  final int indexOfInProgress;
  final double taskSize;
  final double thickness;

  final double lineLength;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Row(
                children: [
                  TaskLineWidget(
                    isFirst: index == 0,
                    isLast: index == taskList.length - 1,
                    taskSize: 50,
                    thickness: 10,
                    title: taskList[index].title,
                    isNotYet: index > indexOfInProgress,
                    child: Icon(
                      taskList[index].icon,
                      color: index > indexOfInProgress
                          ? Colors.black
                          : Colors.white,
                    ),
                  ),
                ],
              );
            },
            itemCount: taskList.length,
          ),
        ),
        // SizedBox(
        //   height: 80,
        //   child: Row(
        //     mainAxisAlignment: MainAxisAlignment.start,
        //     mainAxisSize: MainAxisSize.min,
        //     children: taskList
        //         .map(
        //           (e) => Expanded(
        //             child: SingleChildScrollView(
        //               child: Text(
        //                 e.toString(),
        //                 textAlign: TextAlign.center,
        //               ),
        //             ),
        //           ),
        //         )
        //         .toList(),
        //   ),
        // ),
      ],
    );
  }
}
