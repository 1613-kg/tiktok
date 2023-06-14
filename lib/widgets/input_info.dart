import 'package:flutter/material.dart';

import '../models/constants.dart';

class InputInfo extends StatelessWidget {
  final TextEditingController controller;
  bool toHide;
  String labelText;
  IconData myIcon;

  InputInfo({
    Key? key,
    required this.controller,
    required this.myIcon,
    required this.labelText,
    this.toHide = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: toHide,
      controller: controller,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        icon: Icon(
          myIcon,
          color: Colors.white,
        ),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: borderColor,
            )),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: borderColor,
            )),
      ),
    );
  }
}
