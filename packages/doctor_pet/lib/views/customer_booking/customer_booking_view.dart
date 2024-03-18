import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'customer_booking_controller.dart';

class AppointmentView extends GetView<CustomerBookingController> {
  const AppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Schedule Appointment'),
      ),
      backgroundColor: Colors.pink[50],
      body: Center(
        child: SingleChildScrollView(
          child: Obx(() => Column(
                children: <Widget>[
                  DropdownButton<String>(
                    value: controller.selectedDoctor.value,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        controller.updateSelectedDoctor(newValue);
                      }
                    },
                    items: controller.doctorList
                        .map<DropdownMenuItem<String>>((String doctor) {
                      return DropdownMenuItem<String>(
                        value: doctor,
                        child: Text(doctor),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  TableCalendar(
                    firstDay: DateTime.now(),
                    lastDay: DateTime.now().add(const Duration(
                        days:
                            21)), // Only allow selection up to 3 weeks in the future
                    focusedDay: controller.focusedDay.value,
                    calendarFormat: controller.calendarFormat.value,
                    selectedDayPredicate: (day) =>
                        isSameDay(controller.selectedDate.value, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      if (!selectedDay.isBefore(DateTime.now())) {
                        // Prevent selection of past days
                        controller.updateSelectedDate(selectedDay);
                        controller.updateFocusedDay(focusedDay);
                      }
                    },
                    onPageChanged: (focusedDay) {
                      controller.focusedDay.value = focusedDay;
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () => controller.selectTime(context),
                    child: Text(
                        'Select Time: ${controller.selectedTime.value.format(context)}'),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () =>
                            controller.scheduleAppointment(context),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green),
                        child: const Text('Book Appointment',
                            style: TextStyle(color: Colors.white)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                          label: Text('Field',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                      DataColumn(
                          label: Text('Value',
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                    rows: [
                      DataRow(
                        cells: [
                          const DataCell(Text('Selected Doctor')),
                          DataCell(Text(controller.displayedDoctor.value)),
                        ],
                      ),
                      DataRow(
                        cells: [
                          const DataCell(Text('Selected Date')),
                          DataCell(Text(controller.displayedDate.value)),
                        ],
                      ),
                      DataRow(
                        cells: [
                          const DataCell(Text('Selected Time')),
                          DataCell(Text(controller.displayedTime.value)),
                        ],
                      ),
                      DataRow(
                        cells: [
                          const DataCell(Text('Status')),
                          DataCell(Text(controller.status.value)),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
