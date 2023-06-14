import 'package:flutter/material.dart';

class CustomAddIcon extends StatelessWidget {
  const CustomAddIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Icon(
        Icons.add,
        color: Colors.black,
        size: 25,
      ),
    );
  }
}
