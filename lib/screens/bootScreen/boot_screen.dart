import 'package:flutter/material.dart';
import 'package:indore/screens/welcomeScreen/welcome_screen.dart';
import 'package:lottie/lottie.dart';

class BootScreen extends StatelessWidget {
  const BootScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) =>
              WelcomeScreen(), // Replace with your login screen widget
        ),
      );
    });

    return Scaffold(
      body: Center(
        child: Lottie.asset(
          'animations/boot.json',
          width: 300,
          height: 300,
          repeat: true,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
