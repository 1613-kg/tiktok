import 'package:cloud_firestore/cloud_firestore.dart';

class myUser {
  String name;
  String profilePic;
  String email;
  String uid;

  myUser(
      {required this.name,
      required this.profilePic,
      required this.email,
      required this.uid});

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "profilePic": profilePic,
      "email": email,
      "uid": uid,
    };
  }

  static myUser fromJson(DocumentSnapshot snap) {
    var snapshot = snap.data() as Map<String, dynamic>;
    return myUser(
        email: snapshot['email'],
        profilePic: snapshot['profilePic'],
        name: snapshot['name'],
        uid: snapshot['uid']);
  }
}
