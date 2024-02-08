import 'package:flutter/material.dart';
import 'package:indore/components/mesh_button.dart';
import 'package:indore/screens/welcomeScreen/components/sign_up_button.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  static const List<Map<String, dynamic>> signUpButtonsData = [
    {"image": "assets/google.png", "platform": "Google"},
    {"image": "assets/facebook.png", "platform": "Facebook"},
    {"image": "assets/mail.png", "platform": "Email"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                "assets/twitter.png",
                height: 60,
                fit: BoxFit.contain,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome to MESH! 👋🏼",
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Don't miss the opportunity to be an amazing part of MESH !",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
              ),
              const SizedBox(
                height: 50,
              ),
              // Map over the signUpButtonsData list to create buttons dynamically
              Column(
                children: signUpButtonsData.map((buttonData) {
                  return Column(
                    children: [
                      SignUpButton(
                        image: buttonData["image"],
                        platform: buttonData["platform"],
                      ),
                      const SizedBox(height: 20),
                    ],
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 10,
              ),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "OR",
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MeshButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/login");
                },
                text: "Log In",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
