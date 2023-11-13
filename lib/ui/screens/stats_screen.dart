import 'package:flutter/material.dart';

class StatsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: MediaQuery.of(context).padding.top),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatCard(
                  name: 'Steps',
                  icon: Icons.directions_walk,
                  cardColor: Colors.blue,
                  dummyValue: '5000',
                  progressValue: 0.3, // Progress value between 0.0 and 1.0
                  unit: 'km',
                ),
                StatCard(
                  name: 'Heart Rate',
                  icon: Icons.favorite,
                  cardColor: Colors.red,
                  dummyValue: '75',
                  minMaxText: 'Min: 60 / Max: 90',
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatCard(
                  name: 'Sleep',
                  icon: Icons.airline_seat_individual_suite,
                  cardColor: Colors.purple,
                  dummyValue: '8h 30m',
                  subValues: const ['Deep: 3h', 'Light: 4h', 'REM: 1h 30m', 'Awake: 30m'],
                ),
                StatCard(
                  name: 'Stress',
                  icon: Icons.sentiment_very_dissatisfied,
                  cardColor: Colors.orange,
                  dummyValue: '45',
                ),
                StatCard(
                  name: 'Calories',
                  icon: Icons.local_fire_department,
                  cardColor: Colors.green,
                  dummyValue: '1200',
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatCard(
                  name: 'Weight',
                  icon: Icons.timeline,
                  cardColor: Colors.teal,
                  dummyValue: '70 kg',
                  subValues: const ['Body Fat: 15%'],
                ),
                StatCard(
                  name: 'Blood Pressure',
                  icon: Icons.favorite_border,
                  cardColor: Colors.deepOrange,
                  dummyValue: '120/80',
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StatCard(
                  name: 'Blood Sugar',
                  icon: Icons.local_dining,
                  cardColor: Colors.amber,
                  dummyValue: '90',
                ),
                StatCard(
                  name: 'SpO2',
                  icon: Icons.waves,
                  cardColor: Colors.lightBlue,
                  dummyValue: '98%',
                ),
                StatCard(
                  name: 'Temperature',
                  icon: Icons.thermostat,
                  cardColor: Colors.redAccent,
                  dummyValue: '36.5°C',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class StatCard extends StatelessWidget {
  final String name;
  final IconData icon;
  final Color cardColor;
  final String dummyValue;
  final double? progressValue; // Progress value between 0.0 and 1.0
  final String? unit; // Unit to display for progress
  final String? minMaxText; // Additional text for min and max values
  final List<String>? subValues; // Additional sub-values

  StatCard({
    required this.name,
    required this.icon,
    required this.cardColor,
    required this.dummyValue,
    this.progressValue,
    this.unit,
    this.minMaxText,
    this.subValues,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        elevation: 5,
        color: cardColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 30,
                color: Colors.white,
              ),
              const SizedBox(height: 10),
              Text(
                name,
                style: const TextStyle(fontSize: 14, color: Colors.white),
              ),
              const SizedBox(height: 5),
              if (progressValue != null) ...[
                const SizedBox(height: 10),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircularProgressIndicator(
                      value: progressValue!,
                      color: Colors.white,
                      strokeWidth: 5,
                    ),
                    Text(
                      '${(progressValue! * 100).toInt()}%',
                      style: const TextStyle(fontSize: 12, color: Colors.white),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  '$dummyValue $unit',
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ] else ...[
                const SizedBox(height: 5),
                Text(
                  dummyValue,
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ],
              if (minMaxText != null) ...[
                const SizedBox(height: 5),
                Text(
                  minMaxText!,
                  style: const TextStyle(fontSize: 12, color: Colors.white),
                ),
              ],
              if (subValues != null) ...[
                const SizedBox(height: 5),
                for (String subValue in subValues!)
                  Text(
                    subValue,
                    style: const TextStyle(fontSize: 12, color: Colors.white),
                  ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
