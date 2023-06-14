import 'package:flutter/material.dart';
import 'package:tiktok/models/constants.dart';

import '../providers/auth.dart';
import '../widgets/input_info.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        margin: EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "TikTok Clone",
              style: TextStyle(color: Colors.white, fontSize: 35),
            ),
            SizedBox(
              height: 40,
            ),
            InputInfo(
              controller: emailController,
              myIcon: Icons.email,
              labelText: "Email",
              toHide: false,
            ),
            SizedBox(
              height: 20,
            ),
            InputInfo(
              controller: passwordController,
              myIcon: Icons.lock,
              labelText: "Password",
              toHide: true,
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton(
                onPressed: () {
                  AuthController.instance
                      .login(emailController.text, passwordController.text);
                },
                child: Text("Login")),
          ],
        ),
      ),
    );
  }
}
