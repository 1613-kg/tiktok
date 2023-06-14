import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/models/constants.dart';
import 'package:tiktok/screens/video_preview_screen.dart';

class addVideoScreen extends StatelessWidget {
  const addVideoScreen({super.key});
  videoPick(ImageSource src, BuildContext context) async {
    final video = await ImagePicker().pickVideo(source: src);

    if (video != null) {
      Get.snackbar("Video Selected", video.path);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => videoPreview(
                  videoFile: File(video.path), videoPath: video.path)));
    } else {
      Get.snackbar(
          "Error In Selecting Video", "Please Choose A Different Video File");
    }
  }

  showDialogOpt(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => SimpleDialog(
              children: [
                SimpleDialogOption(
                  onPressed: () => videoPick(ImageSource.camera, context),
                  child: Row(
                    children: [
                      Icon(Icons.camera),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Camera"),
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () => videoPick(ImageSource.gallery, context),
                  child: Row(
                    children: [
                      Icon(Icons.album),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Gallery"),
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Row(
                    children: [
                      Icon(Icons.close),
                      SizedBox(
                        width: 20,
                      ),
                      Text("Close"),
                    ],
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Center(
        child: ElevatedButton(
          child: Text("Add Video"),
          onPressed: () {
            showDialogOpt(context);
          },
        ),
      ),
    );
  }
}
