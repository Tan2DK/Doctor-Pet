import 'package:doctor_pet/core/data/branch_model.dart';
import 'package:doctor_pet/data/data_mock/branch_list_data.dart';
import 'package:doctor_pet/utils/app_enum.dart';
import 'package:doctor_pet/utils/app_extension.dart';
import 'package:doctor_pet/views/customer/customer_booking/widgets/booking_confirm_dialog.dart';
import 'package:get/get.dart';

import '../../../core/data/slot_in_day_model.dart';
import '../../../data/data_mock/slots_in_day_response_data.dart';

class CustomerBookingController extends GetxController {
  Rx<List<BranchModel>> branchList = Rx(BranchListData.data);
  final DateTime now = DateTime.now().copyWith(
    hour: 0,
    minute: 0,
    second: 0,
    microsecond: 0,
    millisecond: 0,
  );
  final Rx<BranchModel> selectedBranch =
      Rx<BranchModel>(BranchListData.data.first);
  RxInt completeStepBooking = RxInt(0);
  Rxn<SlotInDayModel> selectedSlot = Rxn<SlotInDayModel>();
  Rx<List<List<SlotInDayModel>>> doctorSlot =
      Rx<List<List<SlotInDayModel>>>([]);

  void onChanged(BranchModel? branch) {
    selectedBranch.value = branch!;
    branchList.refresh();
  }

  void onSelectedSlot(SlotInDayModel? slotInDay) {
    selectedSlot.value = slotInDay;
    completeStepBooking.value = slotInDay != null ? 1 : 0;
  }

  void onSubmit() {
    if (selectedSlot.value == null) return;
    Get.dialog(
      BookingConfirmDialog(
        branch: selectedBranch.value,
        slotInDay: selectedSlot.value!,
      ),
    );
  }

  void fetchDoctorSlotByBranch() {
    doctorSlot.value = SlotsInDayResponseData.slots.map((slots) {
      List<SlotInDayModel> slotsInDay;
      int nextDay =
          slots.date?.parseDateTime('yyyy-MM-dd').difference(now).inDays ?? 0;
      slotsInDay = List.generate(
        slots.listSlotType?.length ?? 0,
        (index) => SlotInDayModel(
          fixedSlot: FixedSlot.values[slots.listSlotType?[index] ?? 0],
          isAvailable: true,
          nextDay: nextDay,
        ),
      );
      for (var fixedSlot in FixedSlot.values) {
        if (slotsInDay
                .firstWhereOrNull((slot) => slot.fixedSlot == fixedSlot) ==
            null) {
          slotsInDay.add(SlotInDayModel(
              fixedSlot: fixedSlot, isAvailable: false, nextDay: nextDay));
        }
      }
      slotsInDay.sort((a, b) => a.fixedSlot.index.compareTo(b.fixedSlot.index));
      return slotsInDay;
    }).toList();
  }

  @override
  void onInit() {
    super.onInit();
    fetchDoctorSlotByBranch();
  }
}
