import 'package:flutter/material.dart';
import 'package:indore/components/mesh_button.dart';
import 'package:indore/components/sliding_tab.dart';
import 'package:indore/main.dart';
import 'package:indore/screens/loginScreen/components/input_area.dart';
import 'package:indore/components/text_button.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    final tabIndex =
        Provider.of<MyAppState>(context, listen: true).currentTabIndex;

    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(13.0, 53, 13, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Log In",
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Welcome to MESH! Come on in now to continue your journey with us.",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline6!.copyWith(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const SlidingTab(tab1: "Customer", tab2: "Developer"),
                  const SizedBox(
                    height: 30,
                  ),
                  const InputArea(
                    title: "Email",
                    hint: "Enter your email",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const InputArea(
                    title: "Password",
                    hint: "Enter your password",
                  ),
                  tabIndex == 1
                      ? Column(
                          children: const [
                            SizedBox(
                              height: 20,
                            ),
                            InputArea(
                              title: "Dev Code",
                              hint: "Code",
                            ),
                          ],
                        )
                      : const SizedBox(),
                  const SizedBox(height: 50),
                  MeshButton(
                    onPressed: () {
                      tabIndex == 0
                          ? Navigator.pushNamed(context, "/user")
                          : Navigator.pushNamed(context, "/developer");
                      Provider.of<MyAppState>(context, listen: false)
                          .currentTabIndex = 0;
                    },
                    text: "Next",
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextButtonMesh(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    text: "Back",
                  ),
                  const SizedBox(height: 20), // Adjust spacing at the bottom
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
