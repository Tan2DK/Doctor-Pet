import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'doctor_question_controller.dart';

class DoctorQuestionView extends GetView<DoctorQuestionController> {
  const DoctorQuestionView({super.key});

  @override
  Widget build(BuildContext context) {
    final DoctorQuestionController controller =
        Get.find<DoctorQuestionController>();

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 254, 234, 234),
      body: ListView.builder(
        itemCount: controller.doctorQuestions.length,
        itemBuilder: (context, index) {
          final question = controller.doctorQuestions[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox.square(
                      dimension: 50,
                      child: Icon(Icons.person_2_rounded),
                    ),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question.reviewerName,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            question.reviewTime,
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 18,
                              fontWeight: FontWeight.normal,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  question.reviewContent,
                  style: TextStyle(
                    color: Colors.grey.shade600,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 20),
                Obx(() => controller.isReply[index]
                    ? Column(
                        children: [
                          TextField(
                            onChanged: (value) =>
                                controller.updateReplyText(index, value),
                            decoration: const InputDecoration(
                              hintText: 'Your reply...',
                              prefixIcon: Icon(Icons.reply),
                              border: OutlineInputBorder(),
                            ),
                          ),
                          const SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () =>
                                controller.submitDoctorReply(index),
                            child: const Text('Submit Reply'),
                          )
                        ],
                      )
                    : Container()),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () => controller.toggleReply(index),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.reply, color: Colors.blue),
                      SizedBox(width: 5),
                      Text(
                        "Reply",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
                if (controller.doctorQuestions[index].doctorReply.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Reply: ${controller.doctorQuestions[index].doctorReply}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),
    );
  }
}
