import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:indore/main.dart';

const sensors = [
  {
    "name": "33 BLE Sense",
    "status": "Online",
  },
  {
    "name": "GPS Module",
    "status": "Offline",
  },
  {
    "name": "LiDAR+SLAM",
    "status": "Online",
  }
];

const rotors = [
  {
    "name": "Rotor R1",
    "speed": "1000 rpm",
    "angle": "0",
  },
  {
    "name": "Rotor R2",
    "speed": "2010 rpm",
    "angle": "0.8",
  },
  {
    "name": "Rotor R3",
    "speed": "1020 rpm",
    "angle": "0.2",
  },
  {
    "name": "Rotor R4",
    "speed": "3100 rpm",
    "angle": "0.5",
  },
];

class SensorStatus extends StatelessWidget {
  const SensorStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        // shape: const CircleBorder(),
        onPressed: () {
          Navigator.pushNamed(context, "/autoPilot");
          Provider.of<MyAppState>(context, listen: false).currentTabIndex = 0;
        },
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
        label: const Text('Auto Pilot'),
        icon: const Icon(Icons.flight),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Image.asset(
                  "assets/drone.jpg",
                  width: double.infinity,
                  height: 263,
                  fit: BoxFit.cover,
                ),
                Text(
                  "UAV-R76",
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                        fontSize: 33,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    DroneStatus(
                      icon: Icon(Icons.battery_charging_full),
                      status: "100%",
                      feature: "Battery",
                    ),
                    DroneStatus(
                      icon: Icon(Icons.local_airport_outlined),
                      status: "25km",
                      feature: "Range",
                    ),
                    DroneStatus(
                      icon: Icon(Icons.timelapse_rounded),
                      status: "20 mins",
                      feature: "Duration",
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                      ),
                    ],
                  ),
                  child: const Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RPIStatus(
                        icon: Icon(Icons.thermostat_outlined),
                        status: "50 Cel",
                        feature: "Temp",
                      ),

                      //add a vertical divider
                      VerticalDivider(
                        color: Colors.grey,
                        thickness: 2,
                        indent: 8,
                        endIndent: 8,
                      ),
                      RPIStatus(
                        icon: Icon(Icons.waves_outlined),
                        status: "31 Pa",
                        feature: "Pressure",
                      ),
                    ],
                  )),
                ),
                const SizedBox(
                  height: 20,
                ),
                const LeftAlignMainText(
                  text: "Sensors",
                ),
                const SizedBox(
                  height: 10,
                ),
                Column(
                    children: sensors.map((sensor) {
                  return SensorStatusContainer(
                    sensor: sensor,
                  );
                }).toList()),
                const SizedBox(
                  height: 20,
                ),
                const LeftAlignMainText(
                  text: "Rotors",
                ),
                const SizedBox(
                  height: 10,
                ),

                //create a grid with 4 containers with rounded edges and a shadow having an image and two text widgets in column within
                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  mainAxisSpacing: 18,
                  crossAxisSpacing: 18,
                  physics: const NeverScrollableScrollPhysics(),
                  children: rotors.map((rotor) {
                    return RotorStatus(
                      name: rotor["name"]!,
                      speed: rotor["speed"]!,
                      angle: rotor["angle"]!,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SensorStatusContainer extends StatelessWidget {
  final Map<String, String> sensor;
  const SensorStatusContainer({
    required this.sensor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Container(
        width: double.infinity,
        height: 70,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: sensor["status"] == "Online"
              ? Colors.green[100]
              : Colors.red[100],
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                sensor["status"] == "Online" ? Icons.check : Icons.close,
                color: sensor["status"] == "Online" ? Colors.green : Colors.red,
              ),
            ),
            Text(
              sensor["name"]!,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
            ),
            const Spacer(), // Adds spacing between text and the status label
            Text(
              sensor["status"]!,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
            ),
            const Padding(
                padding: EdgeInsets.all(8.0), child: SizedBox(width: 10)),
          ],
        ),
      ),
    );
  }
}

class LeftAlignMainText extends StatelessWidget {
  final String text;
  const LeftAlignMainText({
    required this.text,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft, // Align to the left
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              fontSize: 23,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
      ),
    );
  }
}

class RotorStatus extends StatelessWidget {
  final String name;
  final String speed;
  final String angle;
  const RotorStatus({
    required this.name,
    required this.speed,
    required this.angle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Transform.rotate(
            angle: double.parse(angle), // Rotate by 45 degrees (in radians)
            child: Image.asset(
              "assets/propellor.jpg",
              width: 50,
              height: 50,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            name,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.wind_power,
                color: Colors.grey,
                size: 18,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                speed,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class RPIStatus extends StatelessWidget {
  final Icon icon;
  final String status;
  final String feature;

  const RPIStatus({
    required this.icon,
    required this.status,
    required this.feature,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          status,
          style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                fontSize: 33,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
        ),
        Row(
          children: [
            icon,
            Text(
              feature,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
            ),
          ],
        )
      ],
    );
  }
}

class DroneStatus extends StatelessWidget {
  final Icon icon;
  final String status;
  final String feature;

  const DroneStatus({
    required this.icon,
    required this.status,
    required this.feature,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        icon,
        const SizedBox(
          width: 5,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              feature,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
            ),
            Text(
              status,
              style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
            ),
          ],
        )
      ],
    );
  }
}
