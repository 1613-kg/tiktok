import 'package:flutter/material.dart';
import 'package:tiktok/models/constants.dart';
import 'package:video_player/video_player.dart';

class mainVideoDisplay extends StatefulWidget {
  String videoUrl;
  mainVideoDisplay({super.key, required this.videoUrl});

  @override
  State<mainVideoDisplay> createState() => _mainVideoDisplayState();
}

class _mainVideoDisplayState extends State<mainVideoDisplay> {
  late VideoPlayerController videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    videoPlayerController = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((value) {
        videoPlayerController.play();
        videoPlayerController.setLooping(true);
      });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.black,
      ),
      child: VideoPlayer(videoPlayerController),
    );
  }
}
