enum ContentStatus { pending, approved, rejected }

class Comment {
  final String id; // Định danh duy nhất cho mỗi comment
  final String commenter;
  final String commentText;
  ContentStatus status;
  int likes;
  int dislikes;
  bool isReply;
  String? parentCommentId; // ID của comment gốc, null nếu đây là comment gốc

  Comment({
    required this.id,
    required this.commenter,
    required this.commentText,
    this.status = ContentStatus.pending,
    this.likes = 0,
    this.dislikes = 0,
    this.isReply = false,
    this.parentCommentId,
  });
  void like() {
    likes++;
  }

  void dislike() {
    dislikes++;
  }

  // Các phương thức khác như addReply() có thể được cập nhật để xử lý logic liên quan đến parentCommentId
}
