import 'package:flutter/material.dart';
import 'package:tiktok/models/constants.dart';
import 'package:tiktok/widgets/customAddIcon.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: bgColor,
        onTap: (index) {
          setState(() {
            pageIdx = index;
          });
        },
        currentIndex: pageIdx,
        unselectedItemColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 25),
            label: "Home",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search, size: 25), label: 'Search'),
          BottomNavigationBarItem(icon: CustomAddIcon(), label: 'Create'),
          BottomNavigationBarItem(
              icon: Icon(Icons.message, size: 25), label: 'Messages'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, size: 25), label: 'Profile'),
        ],
      ),
      body: Center(
        child: pageindex[pageIdx],
      ),
    );
  }
}
