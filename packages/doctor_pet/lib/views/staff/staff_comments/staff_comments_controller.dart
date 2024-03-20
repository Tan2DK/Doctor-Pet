import 'package:doctor_pet/core/data/staff_comment.dart';
import 'package:doctor_pet/data/data_mock/data_mock_staff_comment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StaffCommentController extends GetxController {
  Rx<List<Comment>> comments = Rx<List<Comment>>([]);

  @override
  void onInit() {
    super.onInit();
    comments.value = mockComments; // Giả sử bạn đã có mockComments
  }

  void approveComment(Comment comment) {
    final index = comments.value.indexOf(comment);
    if (index != -1) {
      // Cập nhật trạng thái phê duyệt của comment
      // comments.value[index].isApproved = true;
      comments.refresh(); // Cập nhật UI

      // Hiển thị thông báo thành công
      Get.snackbar(
        'Thành công',
        'Comment đã được phê duyệt.',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green,
        colorText: Colors.white,
        icon: const Icon(Icons.check_circle, color: Colors.white),
      );
    }
  }

  void showApproveConfirmationDialog(BuildContext context, Comment comment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận'),
          content: const Text('Bạn có muốn phê duyệt comment này không?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Không'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Có'),
              onPressed: () {
                approveComment(comment);
                Navigator.of(context).pop(); // Đóng dialog
                // Hiển thị thông báo phê duyệt thành công
              },
            ),
          ],
        );
      },
    );
  }

  void showDeleteConfirmationDialog(BuildContext context, Comment comment) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Xác nhận'),
          content: const Text('Bạn có muốn xóa comment này không?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Không'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Có'),
              onPressed: () {
                deleteComment(comment);
                Navigator.of(context).pop(); // Đóng dialog
                // Hiển thị thông báo xóa thành công
                Get.snackbar(
                  'Thành công', // Tiêu đề
                  'Comment đã được xóa thành công.', // Nội dung thông báo
                  snackPosition: SnackPosition.TOP, // Vị trí hiển thị
                  backgroundColor: Colors.green, // Màu nền xanh lá
                  colorText: Colors.white, // Màu chữ trắng
                  icon: const Icon(Icons.check_circle,
                      color: Colors.white), // Thêm icon màu trắng nếu muốn
                );
              },
            ),
          ],
        );
      },
    );
  }

  void deleteComment(Comment comment) {
    comments.value.remove(comment);
    comments.refresh(); // Cập nhật UI
  }
}
