import 'package:doctor_pet/core/data/staff_comment.dart';

final List<Comment> mockComments = [
  Comment(
    id: "c1",
    commenter: "User1",
    commentText: "This is an interesting post!",
    commentTime: "3 day ago",
    status: ContentStatus.approved,
  ),
  Comment(
    id: "c2",
    commenter: "User2",
    commentText: "I completely agree with your point.",
    commentTime: "3 day ago",
    status: ContentStatus.pending,
  ),
  Comment(
    id: "r1",
    commenter: "User3",
    commentText: "Could you provide more details on this topic?",
    commentTime: "3 day ago",
    status: ContentStatus.rejected,
  ),
  Comment(
    id: "c3",
    commenter: "User4",
    commentText: "Great insights, thank you for sharing.",
    commentTime: "3 day ago",
    status: ContentStatus.approved,
  ),
  Comment(
    id: "r2",
    commenter: "User5",
    commentText: "I have some doubts about this information.",
    commentTime: "3 day ago",
    status: ContentStatus.pending,
  ),
  Comment(
    id: "r9",
    commenter: "User6",
    commentText: "Could you provide more details on this topic?",
    commentTime: "3 day ago",
    status: ContentStatus.rejected,
  ),
];
