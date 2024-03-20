import 'package:get/get.dart';
import 'package:doctor_pet/data/data_mock/doctor_question_mock.dart';
import 'package:doctor_pet/core/data/doctor_question.dart';
import 'package:flutter/material.dart';

class DoctorQuestionController extends GetxController {
  final RxList<DoctorQuestion> doctorQuestions = RxList<DoctorQuestion>();
  final RxList<bool> isReply = RxList<bool>();

  @override
  void onInit() {
    super.onInit();
    // Giả sử `mockComments` là danh sách các comment mô phỏng đã được tạo sẵn
    doctorQuestions.value = doctorQuestionsMock;
  }

  void replyToComment(String parentCommentId, String replyContent) {
    final newReply = DoctorQuestion(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      reviewerName:
          "Dr. YourName", // Thay đổi này tùy thuộc vào cách bạn xác định bác sĩ
      reviewTime: "Just now",
      reviewContent: replyContent,
      nameDoctor: "Dr. YourName", // Tên của bác sĩ trả lời
      isReply: true,
      parentCommentId: parentCommentId,
    );

    // Thêm trả lời vào danh sách câu hỏi
    doctorQuestions.add(newReply);
    doctorQuestions.refresh(); // Cập nhật UI
  }

  RxList<DoctorQuestion> showComments() {
    return doctorQuestions; // Trả về danh sách comments hiện tại
  }

  void showReplyInput(BuildContext context, String parentId) {
    TextEditingController replyController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Write your reply'),
          content: TextField(
            controller: replyController,
            decoration: const InputDecoration(hintText: "Reply..."),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text('Reply'),
              onPressed: () {
                if (replyController.text.isNotEmpty) {
                  final index =
                      doctorQuestions.indexWhere((q) => q.id == parentId);
                  if (index != -1) {
                    doctorQuestions[index].reviewContentDoctor =
                        replyController.text;
                    doctorQuestions[index].showReplyField =
                        true; // Show reply field
                    doctorQuestions.refresh();
                  }
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }
}
