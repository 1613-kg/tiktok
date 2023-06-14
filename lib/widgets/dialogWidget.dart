import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class dialogWidget extends StatelessWidget {
  dialogWidget({super.key});

  videoPick(ImageSource src) async {
    final video = await ImagePicker().pickVideo(source: src);
    if (video != null) {
      Get.snackbar("Video Selected", video.path);
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
                  onPressed: () => videoPick(ImageSource.gallery),
                  child: Row(
                    children: [
                      Icon(Icons.camera),
                      Text("Camera"),
                    ],
                  ),
                ),
                SimpleDialogOption(
                  onPressed: () => videoPick(ImageSource.camera),
                  child: Row(
                    children: [
                      Icon(Icons.album),
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
                      Text("Close"),
                    ],
                  ),
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    return showDialogOpt(context);
  }
}
