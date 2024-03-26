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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Clinic Selection Dropdown
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Select a Clinic:',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black54,
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 225, 176, 245),
                                    Color.fromARGB(255, 154, 54, 182)
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: controller.selectedClinic.value,
                                  icon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.white),
                                  dropdownColor: Colors.white,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
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
                                        child: Row(
                                          children: [
                                            const Icon(Icons.local_hospital,
                                                color: Colors.blueGrey),
                                            const SizedBox(width: 10),
                                            Text(clinic),
                                          ],
                                        ),
                                      );
                                    },
                                  ).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Doctor Selection Dropdown
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Select a Doctor:',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            Container(
                              margin: const EdgeInsets.only(right: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 147, 240, 195),
                                    Colors.lightBlueAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: controller.selectedDoctor.value,
                                  icon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.white), // Custom icon color
                                  dropdownColor: Colors.white,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors
                                          .black87), // TextStyle for items
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      controller.updateSelectedDoctor(newValue);
                                    }
                                  },
                                  items: controller.doctorList
                                      .map<DropdownMenuItem<String>>(
                                          (String doctor) {
                                    return DropdownMenuItem<String>(
                                      value: doctor,
                                      child: Row(
                                        children: [
                                          const Icon(Icons.person_outline,
                                              color: Colors
                                                  .blueGrey), // Icon for each item
                                          const SizedBox(width: 10),
                                          Text(doctor),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Pet Selection Dropdown
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Select a Pet:',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black54),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Colors.orangeAccent,
                                    Colors.deepOrangeAccent
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                                borderRadius: BorderRadius.circular(15),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 2,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  isExpanded: true,
                                  value: controller.selectedPet.value,
                                  icon: const Icon(Icons.arrow_drop_down,
                                      color: Colors.white), // Custom icon color
                                  dropdownColor: Colors.white,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors
                                          .black87), // TextStyle for items
                                  onChanged: (String? newValue) {
                                    if (newValue != null) {
                                      controller.updateSelectedPet(newValue);
                                    }
                                  },
                                  items: controller.petList
                                      .map<DropdownMenuItem<String>>(
                                          (String pet) {
                                    return DropdownMenuItem<String>(
                                      value: pet,
                                      child: Row(
                                        children: [
                                          const Icon(Icons.pets,
                                              color: Colors
                                                  .blueGrey), // Icon for each item
                                          const SizedBox(width: 10),
                                          Text(pet),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                // Calendar Selection
                const Text(
                  'Choose a Date:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                const SizedBox(height: 10),
                // Added this line
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color.fromARGB(
                          255, 3, 3, 3), // Màu viền của bạn
                      width: 2, // Độ dày của viền
                    ),
                    borderRadius:
                        BorderRadius.circular(12), // Làm tròn góc nếu bạn muốn
                    boxShadow: [
                      BoxShadow(
                        color: const Color.fromARGB(255, 255, 255, 255)
                            .withOpacity(0.5), // Màu bóng đổ
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: const Offset(0, 3), // Độ lệch của bóng đổ
                      ),
                    ],
                  ),
                  margin: const EdgeInsets.all(
                      10), // Khoảng cách từ viền đến các widget xung quanh
                  child: TableCalendar(
                    // Tất cả các thuộc tính khác của TableCalendar giữ nguyên
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
                    // Bổ sung các thuộc tính khác nếu bạn cần
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
                      const Text(
                        'Select a Time Slot:',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black54),
                      ),
                      const SizedBox(height: 10), // Added this line
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(12), // More rounded corners
                          border: Border.all(
                            color: Colors.indigo
                                .shade100, // Lighter shade for the border
                            width: 2,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.indigo.shade50, // Soft shadow color
                              blurRadius: 10,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<FixedSlot>(
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
                                    style: const TextStyle(
                                      color: Colors.indigo, // Highlight color
                                      fontSize: 18,
                                    )),
                              );
                            }).toList(),
                            icon: const Icon(Icons.keyboard_arrow_down,
                                color: Colors.indigo), // Custom icon
                            iconSize: 30, // Larger icon
                            elevation: 24, // Higher elevation for dropdown menu
                            style: const TextStyle(
                                color: Colors.indigo,
                                fontSize: 20), // Text style
                            dropdownColor:
                                Colors.white, // Background color of dropdown
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Reason for Visit:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ),
                SizedBox(
                  width: 1500, // Tùy chỉnh theo nhu cầu
                  child: TextField(
                    onChanged: (value) {
                      controller.updateAppointmentReason(value);
                    },
                    style: const TextStyle(
                      fontSize: 16, // Kích thước font chữ
                      color: Color.fromARGB(255, 25, 25, 26), // Màu chữ
                    ),
                    decoration: InputDecoration(
                      hintText: 'Enter the reason for the visit',
                      hintStyle: const TextStyle(
                          color:
                              Color.fromARGB(255, 62, 61, 61)), // Màu hint text
                      icon: const Icon(Icons.question_answer,
                          color: Colors.deepPurple), // Thêm icon
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20), // Bo tròn viền
                        borderSide: const BorderSide(color: Colors.deepPurple),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide:
                            BorderSide(color: Colors.deepPurple.shade100),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(
                            color: Color.fromARGB(255, 226, 216, 242)),
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      fillColor:
                          Colors.deepPurple.shade50, // Nền nhẹ cho TextField
                      filled: true, // Kích hoạt chế độ fill
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
                const Text(
                  'Appointment Summary:',
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54),
                ), // Added this line
                Card(
                  elevation: 5.0,
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
