import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/core/data/doctor_question.dart';
import 'doctor_question_controller.dart';

class DoctorQuestionView extends GetView<DoctorQuestionController> {
  DoctorQuestionView({Key? key}) : super(key: key);

  final questionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final DoctorQuestionController controller =
        Get.find<DoctorQuestionController>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Doctor's Questions"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.doctorQuestions.length,
                itemBuilder: (context, index) {
                  final question = controller.doctorQuestions[index];
                  if (question.isReply) {
                    return Container(); // Skip replies in the main list
                  }
                  final replies = controller.doctorQuestions
                      .where((c) => c.parentCommentId == question.id)
                      .toList();
                  return _buildQuestionItem(context, question, replies);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuestionItem(BuildContext context, DoctorQuestion question,
      List<DoctorQuestion> replies) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width:
            MediaQuery.of(context).size.width * 0.95, // Use 95% of screen width
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(question.reviewerName,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(question.reviewContent),
                // Show doctor's reply section only if the showReplyField is true
                if (question.showReplyField &&
                    question.reviewContentDoctor != null &&
                    question.nameDoctor != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Dr. ${question.nameDoctor}",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green)),
                        Text(question.reviewContentDoctor.toString(),
                            style: TextStyle(color: Colors.blue)),
                      ],
                    ),
                  ),
                TextButton.icon(
                  icon: const Icon(Icons.reply),
                  label: const Text("Reply"),
                  onPressed: () =>
                      controller.showReplyInput(context, question.id),
                ),
                ...replies
                    .map((reply) => _buildReplyItem(context, reply))
                    .toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReplyItem(BuildContext context, DoctorQuestion reply) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Card(
        color: Colors.grey[200],
        child: ListTile(
          title: Text(reply.reviewerName,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(reply.reviewContent),
        ),
      ),
    );
  }
}
