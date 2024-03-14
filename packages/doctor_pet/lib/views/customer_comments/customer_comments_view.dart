import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:doctor_pet/core/data/comment.dart';
import 'package:doctor_pet/views/customer_comments/customer_comments_controller.dart';

class CommentView extends GetView<CommentController> {
  CommentView({Key? key}) : super(key: key);

  final commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Comments"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(
              () => ListView.builder(
                itemCount: controller.comments.value.length,
                itemBuilder: (context, index) {
                  final comment = controller.comments.value[index];
                  if (comment.isReply) {
                    return Container(); // Skip replies in the main list
                  }
                  final replies = controller.comments.value
                      .where((c) => c.parentCommentId == comment.id)
                      .toList();
                  return _buildCommentItem(context, comment, replies);
                },
              ),
            ),
          ),
          _buildCommentInput(),
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
        // Set chiều rộng là 90% chiều rộng của màn hình
        child: Card(
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(comment.commenter,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(comment.commentText),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.thumb_up),
                      label: Text("${comment.likes}"),
                      onPressed: () => controller.likeComment(comment.id),
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.thumb_down),
                      label: Text("${comment.dislikes}"),
                      onPressed: () => controller.dislikeComment(comment.id),
                    ),
                    TextButton.icon(
                      icon: const Icon(Icons.reply),
                      label: const Text("Reply"),
                      onPressed: () =>
                          controller.showReplyInput(context, comment.id),
                    ),
                  ],
                ),
                for (var reply in replies) _buildReplyItem(context, reply),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildReplyItem(BuildContext context, Comment reply) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 10),
      child: Card(
        color: Colors.grey[200],
        child: ListTile(
          title: Text(reply.commenter,
              style: const TextStyle(fontWeight: FontWeight.bold)),
          subtitle: Text(reply.commentText),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.thumb_up),
                onPressed: () => controller.likeComment(reply.id),
              ),
              Text("${reply.likes}"),
              IconButton(
                icon: const Icon(Icons.thumb_down),
                onPressed: () => controller.dislikeComment(reply.id),
              ),
              Text("${reply.dislikes}"),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCommentInput() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: commentController,
              decoration: const InputDecoration(hintText: "Write a comment..."),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (commentController.text.isNotEmpty) {
                final newCommentId =
                    DateTime.now().millisecondsSinceEpoch.toString();
                final newComment = Comment(
                  id: newCommentId,
                  commenter: 'User', // Ideally based on the logged-in user
                  commentText: commentController.text,
                  status: ContentStatus.pending,
                  likes: 0,
                  dislikes: 0,
                  isReply: false,
                );
                controller.addComment(newComment);
                commentController.clear();
              }
            },
          ),
        ],
      ),
    );
  }
}
