import 'package:flutter/material.dart';

class Follow extends StatelessWidget {
  var followers;
  var following;
  var posts;
  Follow({super.key, required this.followers, this.following, this.posts});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text(followers.toString()),
            SizedBox(
              height: 10,
            ),
            Text("Followers"),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Text(following.toString()),
            SizedBox(
              height: 10,
            ),
            Text("Following"),
          ],
        ),
        SizedBox(
          width: 20,
        ),
        Column(
          children: [
            Text(posts.toString()),
            SizedBox(
              height: 10,
            ),
            Text("Posts"),
          ],
        ),
      ],
    );
  }
}
