import 'package:doctor_pet/data/data_mock/doctor_slot_in_day_data.dart';
import 'package:doctor_pet/utils/app_enum.dart';
import 'package:doctor_pet/views/schedule/widgets/shedule_slot_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../core/data/doctor_slot_in_day_model.dart';
import 'widgets/slot_widget.dart';

class ScheduleController extends GetxController {
  DateTime now = DateTime.now().copyWith(
    hour: 0,
    minute: 0,
    second: 0,
    microsecond: 0,
    millisecond: 0,
  );
  Rx<DateTime> selectedDay = Rx(
    DateTime.now().copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      microsecond: 0,
      millisecond: 0,
    ),
  );

  Rx<double> pageWidth = Rx<double>(0);
  Rx<List<List<DoctorSlotInDayModel>>> list = Rx(DoctorSlotInDayData.data);

  final PageController pageController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  void onShowScheduleSlot() {
    Get.dialog(
      Dialog(
        child: Obx(
          () => ScheduleSlotWidget(
            slotTime: list.value,
            selectedDay: selectedDay.value,
            onChangedCalendarPage: onChangedCalendarPage,
            pageController: pageController,
            onChangedPage: onPageChange,
            setPageWidth: setPageWidth,
            onChecked: onChecked,
            buildSlotTableWidget: buildSlotTableWidget,
          ),
        ),
      ),
    );
  }

  void onChecked(DoctorSlotInDayModel slotInDay) {
    list.value[slotInDay.nextDay][slotInDay.fixedSlot.index] = list
        .value[slotInDay.nextDay][slotInDay.fixedSlot.index]
        .copyWith(isAvailable: !slotInDay.isAvailable);
    list.refresh();
  }

  void onPageChange(int page) {
    if (page == 0) {
      selectedDay.value = now;
      return;
    }
    selectedDay.value =
        now.add(Duration(days: (7 * page) - DateTime.now().weekday + 1));
  }

  List<Widget> buildSlotTableWidget() {
    final pageNumber = ((now.weekday + list.value.length - 1) / 7).ceil();
    List<Widget> listWidget = [];
    listWidget = list.value
        .asMap()
        .map((index1, slotsInDay) => MapEntry(
              index1,
              Column(
                  mainAxisSize: MainAxisSize.min,
                  children: slotsInDay
                      .asMap()
                      .map((index2, slot) => MapEntry(
                            index2,
                            SlotWidget(
                              doctorSlotInDay: slot,
                              width: pageWidth.value / 7,
                              onChecked: () => onChecked.call(slot),
                            ),
                          ))
                      .values
                      .toList()),
            ))
        .values
        .toList();
    listWidget = [
      ...List.filled(
        now.weekday - 1,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: FixedSlot.values
              .map((_) => SlotWidget(width: pageWidth.value / 7))
              .toList(),
        ),
      ),
      ...listWidget,
    ];
    listWidget = [
      ...listWidget,
      ...List.filled(
        7 * pageNumber - listWidget.length,
        Column(
          mainAxisSize: MainAxisSize.min,
          children: FixedSlot.values
              .map((_) => SlotWidget(width: pageWidth.value / 7))
              .toList(),
        ),
      ),
    ];
    return listWidget;
  }

  void setPageWidth(double pw) => pageWidth.value = pw;

  void onChangedCalendarPage(DateTime focused) {
    selectedDay.value = focused;
    int page = (selectedDay.value.difference(now).inDays / 7).ceil();
    if (pageController.offset % pageWidth.value != 0) return;
    pageController.animateToPage(page,
        duration: const Duration(milliseconds: 250), curve: Curves.easeIn);
  }
}
