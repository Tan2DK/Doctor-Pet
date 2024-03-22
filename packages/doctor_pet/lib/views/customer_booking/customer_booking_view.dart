import 'package:doctor_pet/utils/app_enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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
                  child: Row(
                    children: [
                      // Clinic Selection Dropdown
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Select a Clinic:'),
                            DropdownButton<String>(
                              isExpanded: true,
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
                                  .map<DropdownMenuItem<String>>(
                                      (String clinic) {
                                return DropdownMenuItem<String>(
                                  value: clinic,
                                  child: Text(clinic),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),

                      // Doctor Selection Dropdown
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Select a Doctor:'),
                            DropdownButton<String>(
                              isExpanded: true,
                              value: controller.selectedDoctor.value,
                              onChanged: (String? newValue) {
                                controller.updateSelectedDoctor(newValue!);
                              },
                              items: controller.doctorList
                                  .map<DropdownMenuItem<String>>(
                                      (String doctor) {
                                return DropdownMenuItem<String>(
                                  value: doctor,
                                  child: Text(doctor),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),

                      // Pet Selection Dropdown
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Select a Pet:'),
                            DropdownButton<String>(
                              isExpanded: true,
                              value: controller.selectedPet.value,
                              onChanged: (String? newValue) {
                                controller.updateSelectedPet(newValue!);
                              },
                              items: controller.petList
                                  .map<DropdownMenuItem<String>>((String pet) {
                                return DropdownMenuItem<String>(
                                  value: pet,
                                  child: Text(pet),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
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
                const Text('Reason for Visit:'),
                SizedBox(
                  width: 600, // Set the width to your preference

                  child: TextField(
                    onChanged: (value) {
                      controller.updateAppointmentReason(value);
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter the reason for the visit',
                      border: OutlineInputBorder(),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
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
                Card(
                  elevation: 1.0,
                  margin: const EdgeInsets.all(12.0),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Obx(() => Row(
                          children: <Widget>[
                            // Column for Field names
                            const Expanded(
                              flex: 1, // takes 1/3 of the space
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text('Selected Clinic'),
                                  SizedBox(height: 8.0),
                                  Text('Doctor'),
                                  SizedBox(height: 8.0),
                                  Text('Pet'),
                                  SizedBox(height: 8.0),
                                  Text('Selected Date'),
                                  SizedBox(height: 8.0),
                                  Text('Selected Time'),
                                  SizedBox(height: 8.0),
                                  Text('Reason for Visit'),
                                  SizedBox(height: 8.0),
                                  Text('Status'),
                                ],
                              ),
                            ),
                            // Column for Values
                            Expanded(
                              flex: 2, // takes 2/3 of the space
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(controller.selectedClinic.value),
                                  const SizedBox(height: 8.0),
                                  Text(controller.selectedDoctor.value),
                                  const SizedBox(height: 8.0),
                                  Text(controller.selectedPet.value),
                                  const SizedBox(height: 8.0),
                                  Text(DateFormat('yyyy-MM-dd')
                                      .format(controller.selectedDate.value)),
                                  const SizedBox(height: 8.0),
                                  Text(controller.selectedSlot.value
                                      .name), // Format as needed
                                  const SizedBox(height: 8.0),
                                  Text(controller.appointmentReason.value),
                                  const SizedBox(height: 8.0),
                                  Text(controller.status.value),
                                ],
                              ),
                            ),
                          ],
                        )),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
