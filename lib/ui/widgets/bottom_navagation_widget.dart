import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);
  @override
  Widget build(BuildContext context) {
    return AnimatedNotchBottomBar(
      /// Provide NotchBottomBarController
      notchBottomBarController: _controller,
      color: Colors.white,
      showLabel: false,
      notchColor: Colors.black87,
      removeMargins: false,
      bottomBarWidth: 500,
      durationInMilliSeconds: 300,
      bottomBarItems: const [
        BottomBarItem(
          inActiveItem: Icon(
            Icons.home_filled,
            color: Colors.greenAccent,
          ),
          activeItem: Icon(
            Icons.home_filled,
            color: Colors.greenAccent,
          ),
          itemLabel: 'Home',
        ),
        BottomBarItem(
          inActiveItem: Icon(
            Icons.watch_rounded,
            color: Colors.greenAccent,
          ),
          activeItem: Icon(
            Icons.watch_rounded,
            color: Colors.green,
          ),
          itemLabel: 'Device',
        ),

        ///svg example
        BottomBarItem(
          inActiveItem: Icon(
            Icons.calendar_month,
            color: Colors.greenAccent,
          ),
          activeItem: Icon(
            Icons.calendar_month,
            color: Colors.green,
          ),
          itemLabel: 'Schedule',
        ),
        BottomBarItem(
          inActiveItem: Icon(
            Icons.stacked_bar_chart_outlined,
            color: Colors.greenAccent,
          ),
          activeItem: Icon(
            Icons.stacked_bar_chart_outlined,
            color: Colors.green,
          ),
          itemLabel: 'Stats',
        ),
        BottomBarItem(
          inActiveItem: Icon(
            Icons.monitor_heart,
            color: Colors.greenAccent,
          ),
          activeItem: Icon(
            Icons.monitor_heart,
            color: Colors.green,
          ),
          itemLabel: 'Health Center',
        ),
      ],
      onTap: (index) {
        widget.pageController.jumpToPage(index);
      },
    );
  }
}
