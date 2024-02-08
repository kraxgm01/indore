// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:indore/screens/bootScreen/boot_screen.dart';
import 'package:indore/screens/developerMain/developer_main.dart';
import 'package:indore/screens/loginScreen/login_screen.dart';
import 'package:indore/screens/welcomeScreen/welcome_screen.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:indore/screens/autoPilotScreen/auto_pilot.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => MyAppState(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
              brightness: Brightness.light,
              colorScheme: const ColorScheme.light(
                  background: Colors.white,
                  primary: Color.fromARGB(255, 32, 79, 220),
                  secondary: Colors.grey),
              useMaterial3: true,
              textTheme: TextTheme(
                headlineMedium: GoogleFonts.poppins(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              )),
          initialRoute: "/",
          routes: {
            "/": (context) => BootScreen(),
            "/welcome": (context) => WelcomeScreen(),
            "/login": (context) => LoginScreen(),
            "/developer": (context) => DeveloperMain(),
            "/autoPilot": (context) => AutoPilot(),
          },
        ));
  }
}

class MyAppState extends ChangeNotifier {
  int _currentTabIndex = 0;
  int _povTabIndex = 0;

  int get povTabIndex => _povTabIndex;

  set povTabIndex(int index) {
    _povTabIndex = index;
    notifyListeners();
  }

  // Getter to retrieve the current tab index
  int get currentTabIndex => _currentTabIndex;

  // Setter to update the current tab index
  set currentTabIndex(int index) {
    _currentTabIndex = index;
    notifyListeners(); // Notify listeners that the state has changed
  }
}
