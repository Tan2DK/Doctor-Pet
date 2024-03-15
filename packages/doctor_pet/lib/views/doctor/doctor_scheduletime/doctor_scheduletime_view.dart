import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/views/doctor/doctor_scheduletime/doctor_scheduletime_controller.dart';

class DoctorScheduletimeView extends StatefulWidget {
  const DoctorScheduletimeView({Key? key}) : super(key: key);

  @override
  State<DoctorScheduletimeView> createState() => _DoctorScheduletimeViewState();
}

class _DoctorScheduletimeViewState extends State<DoctorScheduletimeView> {
  final DoctorScheduletimeController controller =
      Get.put(DoctorScheduletimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 234, 234),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          const Center(
            child: Text(
              'Schedule Timings',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Obx(() => ListView(
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var dayOfWeek in controller.listDayOfWeek)
                            _boxDayOfWeek(
                              dayOfWeek,
                              controller.dayOfWeekSelected.value == dayOfWeek,
                              () {
                                controller.setDayOfWeekSelected(dayOfWeek);
                              },
                            ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15),
                    const Divider(),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          const Text(
                            'Time Slots',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Spacer(),
                          IconButton(
                            icon: const Icon(
                              Icons.edit_calendar_rounded,
                              color: Colors.blue,
                            ),
                            onPressed: () =>
                                controller.showEditTimeSlotsDialog(context),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (var timeSlot in controller.userTimeSelections)
                            _boxTime(
                                "${timeSlot['start']?.format(context)} - ${timeSlot['end']?.format(context)}"),
                        ],
                      ),
                    ),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Widget _boxDayOfWeek(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4),
        padding: const EdgeInsets.symmetric(
            vertical: 6, horizontal: 8), // Adjust padding as needed
        decoration: BoxDecoration(
          color: isSelected ? Colors.pinkAccent : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(
            text.substring(
                0, 3), // Display only the first 3 characters of the day
            style: TextStyle(
              fontSize: 14, // Adjust font size as needed
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.grey,
            ),
          ),
        ),
      ),
    );
  }

  Widget _boxTime(String time) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      padding: const EdgeInsets.symmetric(
          vertical: 6, horizontal: 8), // Adjust padding as needed
      decoration: BoxDecoration(
        color: Colors.redAccent,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Center(
        child: Text(
          time,
          style: const TextStyle(
            fontSize: 14, // Adjust font size as needed
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
