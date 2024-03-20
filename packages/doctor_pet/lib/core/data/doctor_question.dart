class DoctorQuestion {
  String id;
  String reviewerName;
  String reviewTime;
  String reviewContent;
  String? reviewContentDoctor;
  String nameDoctor;
  bool isReply;
  String? parentCommentId;
  bool showReplyField = false;

  DoctorQuestion({
    required this.id,
    required this.reviewerName,
    required this.reviewTime,
    required this.reviewContent,
    this.reviewContentDoctor,
    required this.nameDoctor,
    required this.isReply,
    this.parentCommentId,
    this.showReplyField = false,
  });
}
