import 'dart:convert';

import 'package:doctor_pet/core/data/branch_model.dart';
import 'package:doctor_pet/data/data_mock/branch_list_data.dart';
import 'package:doctor_pet/utils/app_enum.dart';
import 'package:doctor_pet/utils/app_extension.dart';
import 'package:doctor_pet/views/customer/customer_booking/widgets/booking_confirm_dialog.dart';
import 'package:get/get.dart';

import '../../../core/data/slot_in_day_model.dart';
import '../../../data/data_mock/slots_in_day_response_data.dart';
import 'package:http/http.dart' as http;

class CustomerBookingController extends GetxController {
  Rx<List<BranchModel>> branchList = Rx([]);
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
        onConfirm: onConfirm,
      ),
    );
  }

  //Todo Luận
  Rx<List<BranchModel>> dataClinic = Rx<List<BranchModel>>([]);
  final String apiUrl = "https://localhost:6789/api/appointments/clinics";

  Future<void> fetchStaff() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final List<BranchModel> clinics = parseStaff(response.body);
        dataClinic.value = clinics;
      } else {
        throw Exception('Failed to load doctors: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Failed to load doctors: $e');
    }
  }

  List<BranchModel> parseStaff(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<BranchModel>((json) {
      return BranchModel.fromMap(json);
    }).toList();
  }

  Future<void> fetchAvailableSlots(
      String clinicId, DateTime startDate, DateTime endDate) async {
    try {
      String apiUrl =
          'https://localhost:5678//api/appointments/slots/$clinicId/${startDate.toIso8601String()}/${endDate.toIso8601String()}';

      var response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);

        List<SlotInDayModel> availableSlots = [];
        for (var slotData in jsonData) {
          var slots = slotData['slots'];
          if (slots != null && slots is List) {
            for (var slot in slots) {
              availableSlots.add(SlotInDayModel(
                fixedSlot: FixedSlot.values[slot],
                isAvailable: true,
                nextDay: 0,
              ));
            }
          }
        }

        doctorSlot.value = [availableSlots];
        update();
      } else {
        print('Error: ${response.reasonPhrase}');
      }
    } catch (error) {
      print('Error: $error');
    }
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

  void onConfirm() {}
}
