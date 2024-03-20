enum ContentStatus { pending, approved, rejected }

class Comment {
  final String id; // Định danh duy nhất cho mỗi comment
  final String commenter;
  final String commentText;
  final String commentTime;
  ContentStatus status;

  String? parentCommentId; // ID của comment gốc, null nếu đây là comment gốc

  Comment({
    required this.id,
    required this.commenter,
    required this.commentText,
    required this.commentTime,
    this.status = ContentStatus.pending,
    this.parentCommentId,
  });

  // Các phương thức khác như addReply() có thể được cập nhật để xử lý logic liên quan đến parentCommentId
}
