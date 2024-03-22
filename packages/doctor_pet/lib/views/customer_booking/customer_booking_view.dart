import 'package:doctor_pet/utils/app_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'customer_booking_controller.dart'; // Ensure this path is correct

class AppointmentView extends GetView<CustomerBookingController> {
  const AppointmentView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          'Schedule Appointment',
          style: TextStyle(color: Colors.white),
        ),
        elevation: 0,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Obx(
            () => Column(
              children: <Widget>[
                // Clinic Selection
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    // Column for text and dropdown
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Select a Clinic:'),
                      const SizedBox(height: 10), // Added this line
                      DropdownButton<String>(
                        // Dropdown for clinic selection
                        value: controller.selectedClinic.value,
                        iconEnabledColor: Colors.blueGrey,
                        dropdownColor: Colors.white,
                        underline: Container(
                          height: 2,
                          color: Colors.amber,
                        ),
                        onChanged: (String? newValue) {
                          if (newValue != null) {
                            controller.updateSelectedClinic(newValue);
                          }
                        },
                        items: controller.clinicList
                            .map<DropdownMenuItem<String>>((String clinic) {
                          return DropdownMenuItem<String>(
                            value: clinic,
                            child: Text(clinic,
                                style: Theme.of(context).textTheme.bodyLarge),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Calendar Selection
                const Text('Choose a Date:'),
                const SizedBox(height: 10), // Added this line
                TableCalendar(
                  // Calendar widget
                  firstDay: DateTime.now(),
                  lastDay: DateTime.now().add(const Duration(days: 21)),
                  focusedDay: controller.focusedDay.value,
                  calendarFormat: controller.calendarFormat.value,
                  selectedDayPredicate: (day) =>
                      isSameDay(controller.selectedDate.value, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    if (!selectedDay.isBefore(DateTime.now())) {
                      controller.updateSelectedDate(selectedDay);
                      controller.updateFocusedDay(focusedDay);
                    }
                  },
                  onPageChanged: (focusedDay) {
                    controller.focusedDay.value = focusedDay;
                  },
                  calendarStyle: const CalendarStyle(
                    todayDecoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                    selectedDecoration: BoxDecoration(
                      color: Colors.blueGrey,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Slot Selection
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    // Column for text and dropdown
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Select a Time Slot:'),
                      const SizedBox(height: 10), // Added this line
                      DropdownButton<FixedSlot>(
                        // Dropdown for slot selection
                        value: controller.selectedSlot.value,
                        onChanged: (FixedSlot? newValue) {
                          if (newValue != null) {
                            controller.updateSelectedSlot(newValue);
                          }
                        },
                        items: FixedSlot.values
                            .map<DropdownMenuItem<FixedSlot>>((slot) {
                          return DropdownMenuItem<FixedSlot>(
                            value: slot,
                            child: Text(slot.name,
                                style: Theme.of(context).textTheme.bodyLarge),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Button to book an appointment
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () =>
                            controller.scheduleAppointment(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 93, 245, 141),
                        ),
                        child: const Text('Book Appointment'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Appointment Summary
                const Text('Appointment Summary:'), // Added this line
                DataTable(
                  // Table to display appointment summary
                  headingTextStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                  headingRowColor: MaterialStateColor.resolveWith((states) =>
                      Colors.grey.shade300), // Header row background color
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text('Field'),
                    ),
                    DataColumn(
                      label: Text('Value'),
                    ),
                  ],
                  rows: [
                    DataRow(
                      color: MaterialStateColor.resolveWith((states) =>
                          states.contains(MaterialState.selected)
                              ? Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.08)
                              : Colors.white),
                      cells: [
                        const DataCell(Text('Selected Clinic')),
                        DataCell(Text(controller.displayedClinic.value)),
                      ],
                    ),
                    DataRow(
                      color: MaterialStateColor.resolveWith((states) =>
                          states.contains(MaterialState.selected)
                              ? Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.08)
                              : Colors.grey.shade50),
                      cells: [
                        const DataCell(Text('Selected Date')),
                        DataCell(Text(controller.displayedDate.value)),
                      ],
                    ),
                    DataRow(
                      color: MaterialStateColor.resolveWith((states) =>
                          states.contains(MaterialState.selected)
                              ? Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.08)
                              : Colors.white),
                      cells: [
                        const DataCell(Text('Selected Time')),
                        DataCell(Text(controller.displayedSlot.value)),
                      ],
                    ),
                    DataRow(
                      color: MaterialStateColor.resolveWith((states) =>
                          states.contains(MaterialState.selected)
                              ? Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.08)
                              : Colors.grey.shade50),
                      cells: [
                        const DataCell(Text('Status')),
                        DataCell(Text(controller.status.value)),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
