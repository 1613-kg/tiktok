import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/providers/profile_controller.dart';

import '../providers/auth.dart';
import '../widgets/follow.dart';
import '../widgets/profilePicture.dart';

class profileScreen extends StatefulWidget {
  String uid;
  profileScreen({super.key, required this.uid});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  final ProfileController profileController = Get.put(ProfileController());
  final AuthController authController = Get.put(AuthController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    profileController.updateUserId(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(
        init: ProfileController(),
        builder: (controller) {
          return (controller.user.isEmpty)
              ? Center(
                  child: CircularProgressIndicator(color: Colors.blue),
                )
              : Scaffold(
                  appBar: AppBar(
                    title: Center(child: Text(controller.user['name'])),
                    actions: [
                      IconButton(onPressed: () {}, icon: Icon(Icons.info)),
                    ],
                  ),
                  body: SafeArea(
                      child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          profilePictureOval(
                            imgUrl: controller.user['profilePic'],
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Follow(
                            followers: controller.user["followers"],
                            following: controller.user["following"],
                            posts: controller.user["thumbnails"].length,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          ElevatedButton(
                            onPressed: () {
                              if (widget.uid ==
                                  FirebaseAuth.instance.currentUser!.uid) {
                                authController.signOut();
                              } else {
                                controller.followUser();
                              }
                            },
                            child: (widget.uid ==
                                    FirebaseAuth.instance.currentUser!.uid)
                                ? Text("Sign Out")
                                : controller.user["isFollowing"]
                                    ? Text("Unfollow")
                                    : Text("Follow"),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Divider(
                            indent: 30,
                            endIndent: 30,
                            thickness: 2,
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          GridView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      childAspectRatio: 1,
                                      mainAxisSpacing: 5,
                                      crossAxisSpacing: 5),
                              itemCount: controller.user['thumbnails'].length,
                              itemBuilder: (context, index) {
                                String thumbnail =
                                    controller.user['thumbnails'][index];
                                return CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: thumbnail,
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error),
                                );
                              })
                        ],
                      ),
                    ),
                  )),
                );
        });
  }
}
