import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/models/constants.dart';

import '../models/user.dart';
import '../providers/search_controller.dart';
import 'profileScreen.dart';

class searchUser extends StatelessWidget {
  searchUser({super.key});

  TextEditingController searchQuery = new TextEditingController();

  final searchUserController searchController = Get.put(searchUserController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: bgColor,
        appBar: AppBar(
          title: TextFormField(
            decoration: new InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                contentPadding:
                    EdgeInsets.only(left: 15, bottom: 11, top: 11, right: 15),
                hintText: "Search Username"),
            controller: searchQuery,
            onChanged: (value) {
              searchController.searchQuery(value);
            },
          ),
        ),
        body: searchController.searchedUsers.isEmpty
            ? Center(
                child: Text("Search Users!"),
              )
            : ListView.builder(
                itemCount: searchController.searchedUsers.length,
                itemBuilder: (context, index) {
                  myUser user = searchController.searchedUsers[index];

                  return ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  profileScreen(uid: user.uid)));
                    },
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(user.profilePic),
                    ),
                    title: Text(user.name),
                  );
                }),
      );
    });
  }
}
