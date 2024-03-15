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
          child: Column(
            children: <Widget>[
              Obx(() => DropdownButton<String>(
                    value: controller.selectedDoctor
                        .value, // The selected value is bound to the controller's RxString
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        controller.updateSelectedDoctor(newValue);
                      }
                    },
                    items: controller.doctorList.map((String doctor) {
                      return DropdownMenuItem<String>(
                        value: doctor,
                        child: Text(
                            doctor), // This text doesn't need to be reactive; it's static.
                      );
                    }).toList(),
                  )),
              const SizedBox(height: 20),

              TableCalendar(
                firstDay: DateTime.utc(2021, 1, 1),
                lastDay: DateTime.utc(2030, 12, 31),
                focusedDay: DateTime.now(),
                calendarFormat: CalendarFormat.month,
                selectedDayPredicate: (day) {
                  return isSameDay(controller.selectedDate.value, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  controller.updateSelectedDate(selectedDay);
                },
                onPageChanged: (focusedDay) {
                  controller.updateFocusedDay(focusedDay);
                },
              ),

              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.selectTime(context, controller);
                },
                child: Obx(() => Text(
                      'Select Time: ${controller.selectedTime.value.format(context)}',
                    )),
              ),
              const SizedBox(height: 20),
              // Aligning the button to the right
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.scheduleAppointment(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                    ),
                    child: const Text(
                      'Book Appointment',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Display selected information after booking in table form
              Obx(() => DataTable(
                    columns: const <DataColumn>[
                      DataColumn(
                        label: Text(
                          'Field',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          'Value',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
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
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
