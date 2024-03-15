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
                // Wrapped the Column with an Obx
                children: <Widget>[
                  DropdownButton<String>(
                    value: controller
                        .selectedDoctor.value, // Current selected value
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        controller.updateSelectedDoctor(
                            newValue); // Directly pass the new value
                      }
                    },
                    items: controller.doctorList
                        .map<DropdownMenuItem<String>>((String doctor) {
                      return DropdownMenuItem<String>(
                        value: doctor,
                        child: Text(doctor), // Display the doctor's name
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 20),
                  TableCalendar(
                    firstDay: DateTime.utc(2021, 1, 1),
                    lastDay: DateTime.utc(2030, 12, 31),
                    focusedDay: controller.focusedDay.value,
                    calendarFormat: CalendarFormat.month,
                    selectedDayPredicate: (day) =>
                        isSameDay(controller.selectedDate.value, day),
                    onDaySelected: (selectedDay, focusedDay) {
                      controller.selectedDate.value = selectedDay;
                      controller.focusedDay.value =
                          focusedDay; // Update focused day reactively
                    },
                    onPageChanged: (focusedDay) {
                      controller.focusedDay.value =
                          focusedDay; // Update focused day reactively
                    },
                    // Add any custom properties here
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      controller.selectTime(
                          context); // Ensure this matches the method signature in your controller
                    },
                    child: Text(
                      'Select Time: ${controller.selectedTime.value.format(context)}',
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Aligning the button to the right
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          controller.scheduleAppointment(
                              context); // Ensure this matches the method signature in your controller
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
                  DataTable(
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
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
