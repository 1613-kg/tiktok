import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tiktok/screens/display_screen.dart';
import 'package:tiktok/screens/profileScreen.dart';
import 'package:tiktok/screens/searchUser_screen.dart';

import '../screens/addVideo_screen.dart';

const bgColor = Colors.black;
var buttonColor = Colors.red[400];
const borderColor = Colors.grey;

var pageindex = [
  displayScreen(),
  searchUser(),
  addVideoScreen(),
  Text("message"),
  profileScreen(uid: FirebaseAuth.instance.currentUser!.uid),
];
