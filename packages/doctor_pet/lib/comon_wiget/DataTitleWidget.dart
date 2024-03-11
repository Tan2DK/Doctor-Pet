import 'package:doctor_pet/core/data/DataTitleModel.dart';
import 'package:flutter/material.dart';

class DataTitleWidget extends StatelessWidget {
  const DataTitleWidget({super.key, required this.titles});

  final List<DataTitleModel> titles;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 70),
        ...titles
            .map(
              (e) => Flexible(
                flex: e.flex,
                fit: FlexFit.tight,
                child: Text(e.name),
              ),
            )
            .toList(),
      ],
    );
  }
}
