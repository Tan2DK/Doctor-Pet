import 'dart:math';

import 'package:doctor_pet/utils/app_constant.dart';

import '../../core/data/doctor_slot_in_day_model.dart';
import '../../utils/app_enum.dart';

class DoctorSlotInDayData {
  DoctorSlotInDayData._();
  static List<List<DoctorSlotInDayModel>> data = List.generate(
    IntConstant.maxDay,
    (index1) => FixedSlot.values
        .asMap()
        .map(
          (index2, value) => MapEntry(
            index2,
            DoctorSlotInDayModel(
              fixedSlot: value,
              nextDay: index1,
              isAvailable: Random().nextBool(),
            ),
          ),
        )
        .values
        .toList(),
  );
}
