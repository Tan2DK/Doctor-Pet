import 'package:doctor_pet/utils/app_enum.dart';

class DoctorSlotInDayModel {
  final int nextDay;
  final FixedSlot fixedSlot;
  final bool isAvailable;
  const DoctorSlotInDayModel({
    this.nextDay = 0,
    this.fixedSlot = FixedSlot.slot1,
    this.isAvailable = false,
  });

  DoctorSlotInDayModel copyWith({
    int? nextDay,
    FixedSlot? fixedSlot,
    bool? isAvailable,
  }) {
    return DoctorSlotInDayModel(
      nextDay: nextDay ?? this.nextDay,
      fixedSlot: fixedSlot ?? this.fixedSlot,
      isAvailable: isAvailable ?? this.isAvailable,
    );
  }
}
