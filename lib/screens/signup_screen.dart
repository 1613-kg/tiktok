import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import '../models/constants.dart';
import '../providers/auth.dart';
import '../widgets/input_info.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  TextEditingController emailController = new TextEditingController();
  TextEditingController setController = new TextEditingController();
  TextEditingController confirmController = new TextEditingController();
  TextEditingController usernameController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.fromLTRB(15, 150, 15, 250),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Welcome to TikTok",
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
              SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () {
                  AuthController.instance.pickImage();
                },
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: NetworkImage(
                          "https://t3.ftcdn.net/jpg/02/09/37/00/360_F_209370065_JLXhrc5inEmGl52SyvSPeVB23hB6IjrR.jpg"),
                    ),
                    Positioned(
                      right: 5,
                      bottom: 5,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60),
                            color: Colors.white),
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
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
                controller: setController,
                myIcon: Icons.lock,
                labelText: "Set Password",
                toHide: true,
              ),
              SizedBox(
                height: 20,
              ),
              InputInfo(
                controller: confirmController,
                myIcon: Icons.lock,
                labelText: "Confirm Password",
                toHide: true,
              ),
              SizedBox(
                height: 20,
              ),
              InputInfo(
                controller: usernameController,
                myIcon: Icons.person,
                labelText: "Username",
                toHide: false,
              ),
              SizedBox(
                height: 50,
              ),
              ElevatedButton(
                  onPressed: () {
                    AuthController.instance.SignUp(
                        usernameController.text,
                        emailController.text,
                        setController.text,
                        AuthController.instance.proimg);
                  },
                  child: Text("Sign Up")),
            ],
          ),
        ),
      ),
    );
  }
}
