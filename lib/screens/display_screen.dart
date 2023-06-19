import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/screens/comments_screen.dart';

import '../providers/upload_video.dart';
import '../providers/video_controller.dart';
import '../widgets/mainVideoDisplay.dart';
import '../widgets/profileButton.dart';
import '../widgets/videoActivity.dart';

class displayScreen extends StatelessWidget {
  displayScreen({super.key});

  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        return PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: videoController.videoList.length,
            controller: PageController(initialPage: 0, viewportFraction: 1.0),
            itemBuilder: (context, index) {
              final data = videoController.videoList[index];
              return Stack(
                children: [
                  mainVideoDisplay(
                    videoUrl: data.videoUrl,
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          data.username,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          data.caption,
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          data.songName,
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height - 400,
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 3,
                          right: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          profileButton(
                            profilePicUrl: data.profilePic,
                            uid: data.uid,
                          ),
                          InkWell(
                            onTap: () {
                              videoController.likedVideo(data.id);
                            },
                            child: Column(
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: (data.likes.contains(FirebaseAuth
                                          .instance.currentUser!.uid)
                                      ? Colors.red
                                      : Colors.white),
                                ),
                                Text(
                                  "Likes",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          commentScreen(id: data.id)));
                            },
                            child: videoActivity(
                              myText: data.commentsCount.toString(),
                              myIcon: Icons.comment,
                            ),
                          ),
                          videoActivity(
                            myText: data.shareCount.toString(),
                            myIcon: Icons.reply_sharp,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            });
      }),
    );
  }
}
