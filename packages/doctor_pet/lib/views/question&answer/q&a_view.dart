import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'q&a_controller.dart';

enum ContentStatus { pending, approved, rejected }

class Tweet {
  final String username;
  final String tweetText;
  int likeCount;
  int replyCount;
  List<Comment> comments;
  ContentStatus status;

  Tweet({
    required this.username,
    required this.tweetText,
    this.likeCount = 0,
    this.replyCount = 0,
    List<Comment>? comments,
    this.status = ContentStatus.pending,
  }) : comments = comments ?? [];

  void addComment(Comment comment) {
    comments.add(comment);
    replyCount++;
  }
}

class Comment {
  final String commenter;
  final String commentText;
  ContentStatus status;

  Comment({
    required this.commenter,
    required this.commentText,
    this.status = ContentStatus.pending,
  });
}

class QandA extends GetView<QuestionAnswerController> {
  const QandA({super.key, Key? keys});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: const ScaffoldWithAppBar(),
        ),
      ),
    );
  }
}

class ScaffoldWithAppBar extends StatefulWidget {
  const ScaffoldWithAppBar({Key? key}) : super(key: key);

  @override
  _ScaffoldWithAppBarState createState() => _ScaffoldWithAppBarState();
}

class _ScaffoldWithAppBarState extends State<ScaffoldWithAppBar> {
  List<Tweet> tweets = [];

  void _addNewTweet(Tweet tweet) {
    setState(() {
      tweets.insert(0, tweet);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text("Flutter Social Media"),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: tweets.length,
              itemBuilder: (context, index) {
                return TweetWidget(
                  tweet: tweets[index],
                  onUpdate: () => setState(() {}),
                );
              },
            ),
          ),
          PostCommentButton(onNewTweet: _addNewTweet),
        ],
      ),
    );
  }
}

class TweetWidget extends StatefulWidget {
  final Tweet tweet;
  final VoidCallback onUpdate;

  const TweetWidget({Key? key, required this.tweet, required this.onUpdate})
      : super(key: key);

  @override
  State<TweetWidget> createState() => _TweetWidgetState();
}

class _TweetWidgetState extends State<TweetWidget> {
  final TextEditingController _replyController = TextEditingController();
  bool _showReplyBox = false;

  void _toggleReplyBox() {
    setState(() {
      _showReplyBox = !_showReplyBox;
    });
  }

  void _submitReply() {
    final String replyText = _replyController.text.trim();
    if (replyText.isNotEmpty) {
      final Comment newReply = Comment(
        commenter: 'ReplyUser',
        commentText: replyText,
        status: ContentStatus.pending,
      );
      setState(() {
        widget.tweet.addComment(newReply);
        _replyController.clear();
        _showReplyBox = false;
      });
      widget.onUpdate();
    }
  }

  String getContentStatusText(ContentStatus status) {
    switch (status) {
      case ContentStatus.pending:
        return 'Pending';
      case ContentStatus.approved:
        return 'Approved';
      case ContentStatus.rejected:
        return 'Rejected';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://i.pravatar.cc/300?u=${widget.tweet.username}'),
            ),
            title: Text(widget.tweet.username),
            subtitle: Text(widget.tweet.tweetText),
            trailing: Text(
              getContentStatusText(widget.tweet.status),
              style: TextStyle(
                color: widget.tweet.status == ContentStatus.pending
                    ? Colors.orange
                    : (widget.tweet.status == ContentStatus.approved
                        ? Colors.green
                        : Colors.red),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton.icon(
                icon: const Icon(Icons.thumb_up_alt_outlined),
                label: Text('${widget.tweet.likeCount}'),
                onPressed: () {
                  setState(() {
                    widget.tweet.likeCount++;
                  });
                },
              ),
              TextButton.icon(
                icon: const Icon(Icons.comment),
                label: Text('${widget.tweet.replyCount}'),
                onPressed: _toggleReplyBox,
              ),
            ],
          ),
          if (_showReplyBox)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _replyController,
                      decoration: InputDecoration(
                        hintText: "Write a reply...",
                        fillColor: Colors.grey[200],
                        filled: true,
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(30), // Correct usage
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.send),
                    onPressed: _submitReply,
                  ),
                ],
              ),
            ),
          ...widget.tweet.comments
              .map((comment) => ListTile(
                    title: Text(comment.commenter),
                    subtitle: Text(comment.commentText),
                    trailing: Text(
                      getContentStatusText(comment.status),
                      style: TextStyle(
                        color: comment.status == ContentStatus.pending
                            ? Colors.orange
                            : (comment.status == ContentStatus.approved
                                ? Colors.green
                                : Colors.red),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ))
              .toList(),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _replyController.dispose();
    super.dispose();
  }
}

class PostCommentButton extends StatelessWidget {
  final Function(Tweet) onNewTweet;

  const PostCommentButton({Key? key, required this.onNewTweet})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () => _showPostTweetDialog(context),
        child: const Text('Post Questions'),
      ),
    );
  }

  void _showPostTweetDialog(BuildContext context) {
    final TextEditingController tweetController = TextEditingController();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('New Questions'),
          content: TextField(
            controller: tweetController,
            decoration: const InputDecoration(hintText: "What's happening?"),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('Post'),
              onPressed: () {
                final tweetText = tweetController.text.trim();
                if (tweetText.isNotEmpty) {
                  final newTweet = Tweet(
                    username: 'YourUsername',
                    tweetText: tweetText,
                    status: ContentStatus.pending,
                  );
                  onNewTweet(newTweet);
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
