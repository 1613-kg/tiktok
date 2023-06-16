import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/models/constants.dart';
import 'package:tiktok/providers/comment_controller.dart';
import 'package:timeago/timeago.dart' as tago;

import '../providers/comment_controller.dart';

class commentScreen extends StatelessWidget {
  final String id;
  commentScreen({super.key, required this.id});

  TextEditingController _commentController = new TextEditingController();
  CommentController commentController = Get.put(CommentController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    commentController.updatePostId(id);
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: SizedBox(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  return ListView.builder(
                      shrinkWrap: true,
                      itemCount: commentController.commentList.length,
                      itemBuilder: (context, index) {
                        final comment = commentController.commentList[index];
                        return ListTile(
                          leading: CircleAvatar(
                              backgroundImage:
                                  NetworkImage(comment.profilePic)),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                comment.username,
                                style: TextStyle(
                                    fontSize: 13,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.redAccent),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                comment.comment,
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              )
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                tago.format(comment.datePub.toDate()),
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "${comment.likes.length} Likes",
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          trailing: InkWell(
                              onTap: () {
                                commentController.likedVideo(comment.id);
                              },
                              child: Icon(Icons.favorite,
                                  color: comment.likes.contains(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      ? Colors.red
                                      : Colors.white)),
                        );
                      });
                }),
              ),
              ListTile(
                title: TextFormField(
                  controller: _commentController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.comment),
                    labelText: "Comment",
                  ),
                ),
                trailing: TextButton(
                  onPressed: () {
                    commentController.uploadComment(_commentController.text);
                  },
                  child: Text("Send"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
