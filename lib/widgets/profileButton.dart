import 'package:flutter/material.dart';
import 'package:tiktok/screens/profileScreen.dart';

class profileButton extends StatelessWidget {
  String profilePicUrl;
  String uid;
  profileButton({super.key, required this.profilePicUrl, required this.uid});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => profileScreen(uid: uid)));
      },
      child: SizedBox(
        width: 70,
        height: 70,
        child: Stack(
          children: [
            Positioned(
                left: 5,
                child: Container(
                  width: 60,
                  height: 60,
                  padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(35),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Image(
                      image: NetworkImage(profilePicUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
