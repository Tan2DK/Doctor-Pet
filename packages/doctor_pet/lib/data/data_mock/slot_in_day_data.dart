import 'dart:math';

import 'package:doctor_pet/utils/app_constant.dart';

import '../../core/data/slot_in_day_model.dart';
import '../../utils/app_enum.dart';

class DoctorSlotInDayData {
  DoctorSlotInDayData._();
  static List<List<SlotInDayModel>> data = List.generate(
    IntConstant.maxDay,
    (index1) => FixedSlot.values
        .asMap()
        .map(
          (index2, value) => MapEntry(
            index2,
            SlotInDayModel(
              fixedSlot: value,
              nextDay: index1,
              isAvailable: Random().nextBool() ? Random().nextBool() : null,
            ),
          ),
        )
        .values
        .toList(),
  );
}
