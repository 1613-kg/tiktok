import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class profilePictureOval extends StatelessWidget {
  String imgUrl;
  profilePictureOval({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        imageUrl: imgUrl,
        fit: BoxFit.contain,
        height: 100,
        width: 100,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error),
      ),
    );
  }
}
