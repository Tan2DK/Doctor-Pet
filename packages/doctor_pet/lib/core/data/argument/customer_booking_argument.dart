import '../slot_in_day_model.dart';

class CustomerBookingArgument {
  final List<List<SlotInDayModel>> availableSlots;
  final Function(SlotInDayModel?) onSelectedSlot;
  CustomerBookingArgument({
    required this.availableSlots,
    required this.onSelectedSlot,
  });
}
