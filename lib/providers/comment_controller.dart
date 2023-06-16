import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/comments.dart';
import 'auth.dart';

class CommentController extends GetxController {
  final Rx<List<Comment>> _commentList = Rx<List<Comment>>([]);
  List<Comment> get commentList => _commentList.value;

  String _postId = "";
  updatePostId(String id) {
    _postId = id;
    fetchComment();
  }

  fetchComment() async {
    _commentList.bindStream(FirebaseFirestore.instance
        .collection("videos")
        .doc(_postId)
        .collection("comments")
        .snapshots()
        .map((QuerySnapshot query) {
      List<Comment> retVal = [];
      for (var element in query.docs) {
        retVal.add(Comment.fromSnap(element));
      }
      return retVal;
    }));
  }

  uploadComment(String comm) async {
    try {
      if (comm.isNotEmpty) {
        DocumentSnapshot userDoc = await FirebaseFirestore.instance
            .collection("users")
            .doc(FirebaseAuth.instance.currentUser!.uid..toString())
            .get();

        var allDocs = await FirebaseFirestore.instance
            .collection("videos")
            .doc(_postId)
            .collection("comments")
            .get();

        int len = allDocs.docs.length;
        Comment comment = Comment(
            username: (userDoc.data() as dynamic)['name'],
            comment: comm.trim(),
            datePub: DateTime.now(),
            likes: [],
            profilePic: (userDoc.data() as dynamic)['profilePic'],
            uid: FirebaseAuth.instance.currentUser!.uid,
            id: 'Comment $len');

        await FirebaseFirestore.instance
            .collection("videos")
            .doc(_postId)
            .collection("comments")
            .doc('Comment $len')
            .set(comment.toJson());
        DocumentSnapshot doc = await FirebaseFirestore.instance
            .collection('videos')
            .doc(_postId)
            .get();
        await FirebaseFirestore.instance
            .collection('videos')
            .doc(_postId)
            .update({
          'commentsCount': (doc.data() as dynamic)['commentsCount'] + 1,
        });
      } else {
        Get.snackbar(
            "Please Enter some content", "Please write something in comment");
      }
    } catch (e) {
      Get.snackbar("Error in sending comment", e.toString());
    }
  }

  likedVideo(String id) async {
    DocumentSnapshot doc = await FirebaseFirestore.instance
        .collection("videos")
        .doc(_postId)
        .collection("comments")
        .doc(id)
        .get();

    var uid = AuthController.instance.user.uid;
    if ((doc.data() as dynamic)['likes'].contains(uid)) {
      await FirebaseFirestore.instance
          .collection("videos")
          .doc(_postId)
          .collection("comments")
          .doc(id)
          .update({
        'likes': FieldValue.arrayRemove([uid]),
      });
    } else {
      await FirebaseFirestore.instance
          .collection("videos")
          .doc(_postId)
          .collection("comments")
          .doc(id)
          .update({
        'likes': FieldValue.arrayUnion([uid]),
      });
    }
  }
}
