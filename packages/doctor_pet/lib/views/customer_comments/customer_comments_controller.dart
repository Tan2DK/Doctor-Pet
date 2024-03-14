import 'package:doctor_pet/core/data/comment.dart';
import 'package:doctor_pet/data/data_mock/commentlist.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommentController extends GetxController {
  Rx<List<Comment>> comments = Rx<List<Comment>>([]);

  @override
  void onInit() {
    super.onInit();
    // Giả sử `mockComments` là danh sách các comment mô phỏng đã được tạo sẵn
    comments.value = mockComments;
  }

  void addComment(Comment comment) {
    comments.value.add(comment);
    // Thực hiện gọi API để thêm comment vào server ở đây (nếu cần)
    comments.refresh(); // Cập nhật UI sau khi thêm comment
  }

  void replyToComment(String parentCommentId, Comment reply) {
    // Tìm comment gốc và thêm reply vào danh sách replies của nó
    // Trong ví dụ này, chúng ta không duy trì một danh sách riêng cho replies trong mỗi comment
    // thay vào đó, chúng ta xem reply cũng như một comment bình thường với parentCommentId
    reply.isReply = true; // Đánh dấu reply này là một phản hồi
    reply.parentCommentId = parentCommentId;
    comments.value.add(reply);
    // Thực hiện gọi API để thêm reply vào server ở đây (nếu cần)
    comments.refresh(); // Cập nhật UI sau khi thêm reply
  }

  void likeComment(String commentId) {
    // Tìm comment bằng id và tăng số lượng likes của nó
    var index = comments.value.indexWhere((comment) => comment.id == commentId);
    if (index != -1) {
      comments.value[index].like(); // Tăng like
      // Thực hiện gọi API để cập nhật số like của comment trên server ở đây (nếu cần)
      comments.refresh(); // Cập nhật UI
    }
  }

  void dislikeComment(String commentId) {
    // Tìm comment bằng id và tăng số lượng dislikes của nó
    var index = comments.value.indexWhere((comment) => comment.id == commentId);
    if (index != -1) {
      comments.value[index].dislike(); // Tăng dislike
      // Thực hiện gọi API để cập nhật số dislike của comment trên server ở đây (nếu cần)
      comments.refresh(); // Cập nhật UI sau khi thực hiện dislike
    }
  }

  Rx<List<Comment>> showComments() {
    return comments; // Trả về danh sách comments hiện tại
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
                  // Tạo ID reply mới - trong thực tế, ID này có thể do server quản lý
                  final replyId =
                      DateTime.now().millisecondsSinceEpoch.toString();
                  final newReply = Comment(
                    id: replyId,
                    commenter:
                        'User', // Thay thế bằng thông tin người dùng thực
                    commentText: replyController.text,
                    status: ContentStatus
                        .approved, // Hoặc bất kỳ status nào phù hợp
                    likes: 0,
                    dislikes: 0,
                    isReply: true,
                    parentCommentId: parentId,
                  );

                  Get.find<CommentController>().replyToComment(parentId,
                      newReply); // Sử dụng Get.find để truy cập CommentController
                  Navigator.of(context).pop(); // Đóng dialog
                }
              },
            ),
          ],
        );
      },
    );
  }
}
