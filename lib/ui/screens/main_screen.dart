import 'package:flutter/material.dart';
import 'package:health_app/ui/widgets/bottom_navagation_widget.dart';
import 'package:health_app/ui/screens/device_screen.dart';
import 'package:health_app/ui/screens/health_screen.dart';
import 'package:health_app/ui/screens/home_screen.dart';
import 'package:health_app/ui/screens/schedule_screen.dart';
import 'package:health_app/ui/screens/settings_screen.dart';
import 'package:health_app/ui/screens/stats_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// List of pages to be shown in PageView
  final List<Widget> bottomBarPages = <Widget>[
     HomeScreen(),
    const DeviceScreen(),
    const ScheduleScreen(),
    const SettingsScreen(),
    const StatsScreen(),
    const HealthScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: BottomNavigation(pageController: _pageController),
    );
  }
}