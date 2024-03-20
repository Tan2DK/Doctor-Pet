import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/core/data/staff_comment.dart';

import 'package:doctor_pet/views/staff/staff_comments/staff_comments_controller.dart';

class StaffCommentView extends GetView<StaffCommentController> {
  StaffCommentView({Key? key}) : super(key: key);

  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding:
                EdgeInsets.only(left: 10.0), // Đẩy tiêu đề sang trái một chút
            child: Text("Staff Comments Manager"),
          ),
        ),
        centerTitle: false, // Đặt false để cho phép title căn chỉnh sang trái
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.comments.value.length,
                itemBuilder: (context, index) {
                  final comment = controller.comments.value[index];

                  final replies = controller.comments.value
                      .where((c) => c.parentCommentId == comment.id)
                      .toList();
                  return _buildCommentItem(context, comment, replies);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCommentItem(
      BuildContext context, Comment comment, List<Comment> replies) {
    return Align(
      alignment: Alignment.centerLeft,
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(comment.commenter,
                          style: const TextStyle(fontWeight: FontWeight.bold)),
                    ),
                    Text(
                      comment.commentTime,
                      style: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(comment.commentText),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.check, color: Colors.green),
                      onPressed: () {
                        controller.showApproveConfirmationDialog(
                            context, comment);
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.close, color: Colors.red),
                      onPressed: () {
                        // Sử dụng phương thức từ controller để hiển thị dialog xác nhận
                        controller.showDeleteConfirmationDialog(
                            context, comment);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
