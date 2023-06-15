import 'package:flutter/material.dart';
import 'package:tiktok/screens/display_screen.dart';

import '../screens/addVideo_screen.dart';

const bgColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

var pageindex = [
  displayScreen(),
  Text("search"),
  addVideoScreen(),
  Text("message"),
  Text("profile"),
];
