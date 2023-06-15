import 'package:flutter/material.dart';

class videoActivity extends StatelessWidget {
  IconData myIcon;
  String myText;
  videoActivity({super.key, required this.myIcon, required this.myText});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          myIcon,
          color: Colors.white,
        ),
        Text(
          myText,
          style: TextStyle(color: Colors.white),
        ),
      ],
    );
  }
}
