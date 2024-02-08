// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:indore/screens/developerMain/sub_screens/analytics/drone_pov_dev.dart';
import 'package:indore/screens/developerMain/sub_screens/sensorStatus/sensor_status.dart';
import 'package:indore/screens/developerMain/sub_screens/settingsScreen/settings_screen.dart';

class DeveloperMain extends StatefulWidget {
  const DeveloperMain({super.key});

  @override
  State<DeveloperMain> createState() => _DeveloperMainState();
}

class _DeveloperMainState extends State<DeveloperMain> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = <Widget>[
    SensorStatus(),
    DronePOV(),
    SettingsDev() // Create a ProfilePage widget for the "Profile" page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8.0, 8, 8, 0),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 15),
          child: GNav(
            gap: 8,
            backgroundColor: Theme.of(context).colorScheme.primary,
            color: Theme.of(context).colorScheme.surface,
            activeColor: Theme.of(context).colorScheme.primary,
            tabBackgroundColor: Theme.of(context).colorScheme.surface,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.sensors,
                text: 'Sensor Checkup',
              ),
              GButton(
                icon: Icons.landscape_rounded,
                text: 'Drone POV',
              ),
              GButton(icon: Icons.settings, text: 'Settings')
            ],
            selectedIndex: _selectedIndex, // Set the selected index here
            onTabChange: (index) {
              setState(() {
                _selectedIndex =
                    index; // Update the selected index when a tab is tapped
              });
            },
          ),
        ),
      ),
    );
  }
}
