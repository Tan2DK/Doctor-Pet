import 'package:doctor_pet/utils/app_enum.dart';

class SlotInDayModel {
  final int nextDay;
  final FixedSlot fixedSlot;
  final bool? isAvailable;
  const SlotInDayModel({
    this.nextDay = 0,
    this.fixedSlot = FixedSlot.slot1,
    this.isAvailable,
  });

  SlotInDayModel copyWith({
    int? nextDay,
    FixedSlot? fixedSlot,
    bool? isAvailable,
  }) {
    return SlotInDayModel(
      nextDay: nextDay ?? this.nextDay,
      fixedSlot: fixedSlot ?? this.fixedSlot,
      isAvailable: isAvailable,
    );
  }

  @override
  String toString() =>
      'SlotInDayModel(nextDay: $nextDay, fixedSlot: $fixedSlot, isAvailable: $isAvailable)\n';
}
