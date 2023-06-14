import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/providers/upload_video.dart';
import 'package:video_player/video_player.dart';

class videoPreview extends StatefulWidget {
  File videoFile;
  String videoPath;

  videoPreview({Key? key, required this.videoFile, required this.videoPath})
      : super(key: key);
  @override
  State<videoPreview> createState() => _videoPreviewState();
}

class _videoPreviewState extends State<videoPreview> {
  late VideoPlayerController videoPlayerController;
  VideoUploadController videoUploadController =
      Get.put(VideoUploadController());
  TextEditingController songNameController = new TextEditingController();
  TextEditingController captionController = new TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      videoPlayerController = VideoPlayerController.file(widget.videoFile);
    });
    videoPlayerController.initialize();
    videoPlayerController.play();
    videoPlayerController.setLooping(true);
    videoPlayerController.setVolume(0.7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.4,
            child: VideoPlayer(videoPlayerController),
          ),
          Container(
            child: Column(
              children: [
                TextFormField(
                  controller: songNameController,
                  decoration: InputDecoration(
                    labelText: "Enter Song",
                    icon: Icon(Icons.music_note),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: captionController,
                  decoration: InputDecoration(
                    labelText: "Enter Caption",
                    icon: Icon(Icons.closed_caption),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ElevatedButton(
                  onPressed: () {
                    videoUploadController.uploadVideo(songNameController.text,
                        captionController.text, widget.videoPath);
                  },
                  child: Text(
                    "Upload",
                  ),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStatePropertyAll<Color>(Colors.white),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
