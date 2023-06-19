import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../models/user.dart';

class searchUserController extends GetxController {
  final Rx<List<myUser>> _searchList = Rx<List<myUser>>([]);
  List<myUser> get searchedUsers => _searchList.value;

  searchQuery(String query) async {
    _searchList.bindStream(FirebaseFirestore.instance
        .collection("users")
        // .doc(FirebaseAuth.instance.currentUser!.uid)
        // .collection("name")
        .where("name", isGreaterThanOrEqualTo: query)
        .snapshots()
        .map((QuerySnapshot queryRes) {
      List<myUser> retVal = [];
      for (var element in queryRes.docs) {
        retVal.add(myUser.fromJson(element));
      }
      return retVal;
    }));
  }
}
