import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import 'package:doctor_pet/utils/app_extension.dart';

import 'package:doctor_pet/core/data/doctor_slot_in_day_model.dart';
import 'package:doctor_pet/utils/app_enum.dart';
import 'package:doctor_pet/utils/app_helper.dart';

class RowCalendarWidget extends StatelessWidget {
  const RowCalendarWidget({
    Key? key,
    required this.constraints,
    required this.lPadding,
    this.selectedDay,
    required this.slotTime,
    this.onChangedCalendarPage,
  }) : super(key: key);
  final BoxConstraints constraints;
  final int lPadding;
  final DateTime? selectedDay;
  final List<List<DoctorSlotInDayModel>> slotTime;
  final Function(DateTime)? onChangedCalendarPage;

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now().copyWith(
      hour: 0,
      minute: 0,
      second: 0,
      microsecond: 0,
      millisecond: 0,
    );
    final maxDay = now.add(Duration(days: slotTime.length - 1));
    final monthYear =
        '${AppHelper.formatMonthNumber((selectedDay ?? now).month)} ${(selectedDay ?? now).formatDateTime('yyyy')}';
    return Row(
      children: [
        Container(
          height: 60,
          width: lPadding.toDouble(),
          padding: const EdgeInsets.symmetric(horizontal: 4),
          margin: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          alignment: Alignment.centerLeft,
          child: Text(
            monthYear,
            style: TextStyle(
                fontSize: constraints.maxWidth > 420 ? 16 : 12,
                color: Colors.black),
          ),
        ),
        Expanded(
          child: Column(
            children: [
              TableCalendar(
                rowHeight: 30,
                calendarBuilders: CalendarBuilders(
                  defaultBuilder: (context, day, focusedDay) => Padding(
                    padding: const EdgeInsets.all(4),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          day.day.toString(),
                          style: const TextStyle(
                            fontSize: 16,
                            height: 1,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  todayBuilder: (context, day, focusedDay) => Center(
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          day.day.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            height: 1,
                            color: Theme.of(context).colorScheme.onPrimary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  disabledBuilder: (context, day, focusedDay) => Padding(
                    padding: const EdgeInsets.all(4),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          day.day.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            height: 1,
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                  outsideBuilder: (context, day, focusedDay) => Padding(
                    padding: const EdgeInsets.all(4),
                    child: Center(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          day.day.toString(),
                          style: TextStyle(
                            fontSize: 16,
                            height: 1,
                            color: Theme.of(context).disabledColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                availableGestures: AvailableGestures.horizontalSwipe,
                onPageChanged: onChangedCalendarPage,
                firstDay: now,
                lastDay: maxDay,
                focusedDay: selectedDay ?? now,
                calendarFormat: CalendarFormat.week,
                startingDayOfWeek: StartingDayOfWeek.monday,
                headerVisible: false,
                daysOfWeekVisible: false,
                calendarStyle: const CalendarStyle(
                  isTodayHighlighted: true,
                  weekendTextStyle: TextStyle(
                    fontSize: 10,
                    height: 1,
                    color: Colors.black,
                  ),
                ),
                availableCalendarFormats: const {CalendarFormat.week: 'Week'},
              ),
              SizedBox(
                height: 30,
                child: Row(
                  children: Weekday.values
                      .map(
                        (e) => Expanded(
                          child: Text(
                            constraints.maxWidth > 450
                                ? e.getAbbr
                                : e.getAbbr.substring(0, 1),
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              height: 1,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
