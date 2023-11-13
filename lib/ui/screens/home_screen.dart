import 'package:flutter/material.dart';
import 'package:forked_slider_button/forked_slider_button.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<bool> tasks = List.generate(6, (index) => false);
  List<String> icons = [
    "assets/task1.png",
    "assets/task2.png",
    "assets/task3.png",
    "assets/task4.png",
  ];

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    void showTaskBottomSheet() {
      showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, StateSetter setState) {
            return Container(
              height: deviceHeight * 0.6,
              width: deviceWidth,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(deviceWidth * 0.1),
                  topRight: Radius.circular(deviceWidth * 0.1),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(deviceWidth * 0.03),
                    child: Text(
                      'Daily Tasks',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: deviceWidth * 0.06,
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 6,
                      itemExtent: deviceHeight * 0.12,
                      itemBuilder: (context, index) {
                        String taskTitle = 'Task ${index + 1}';
                        String taskSubtitle = 'Time ${index + 1}:00 PM';

                        return ListTile(
                          leading: SizedBox(
                              width: deviceWidth * 0.1,
                              height: deviceWidth * 0.15,
                              child: Image.asset(icons[index % 4], fit: BoxFit.cover)),
                          title: Text(
                            taskTitle,
                            style: TextStyle(
                              decoration: tasks[index] ? TextDecoration.lineThrough : TextDecoration.none,
                            ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: deviceHeight * 0.02),
                              const Text('description'),
                              Text(taskSubtitle),
                            ],
                          ),
                          trailing: Checkbox(
                            value: tasks[index],
                            onChanged: (value) {
                              setState(() {
                                tasks[index] = value!;
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          });
        },
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: deviceHeight * 0.08),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: deviceWidth * 0.05),
                  child: Text(
                    'Hello John Doe 😊',
                    style: TextStyle(
                      color: Colors.greenAccent,
                      fontSize: deviceWidth * 0.06,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: deviceWidth * 0.05),
                  child: CircleAvatar(
                    radius: deviceWidth * 0.06,
                    backgroundImage: const AssetImage('assets/amine.jpg'),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, left: deviceWidth * 0.05, right: deviceWidth * 0.08),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Upcoming Appointment',
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: deviceWidth * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.7,
              margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFFCF6F80),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('12', style: Theme.of(context).textTheme.titleLarge),
                          Text('Aug', style: Theme.of(context).textTheme.titleSmall),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Dr. John Doe', style: Theme.of(context).textTheme.titleLarge),
                      Text('Dentist', style: Theme.of(context).textTheme.titleSmall),
                      Text('10:00 AM', style: Theme.of(context).textTheme.titleSmall),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, left: deviceWidth * 0.05, right: deviceWidth * 0.05),
            child: Container(
              height: deviceHeight * 0.2,
              width: deviceWidth * 0.8,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.blue, Colors.lightBlueAccent],
                  stops: [0.3, 1],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
                borderRadius: BorderRadius.circular(deviceWidth * 0.04),
              ),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: EdgeInsets.only(top: deviceHeight * 0.03, left: deviceWidth * 0.03),
                      child: Text(
                        'Complete your daily \ntasks',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: deviceWidth * 0.05,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: showTaskBottomSheet,
                      child: Padding(
                        padding: EdgeInsets.only(
                          top: deviceHeight * 0.07,
                          left: deviceWidth * 0.03,
                        ),
                        child: Container(
                          height: deviceHeight * 0.05,
                          width: deviceWidth * 0.3,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(
                              Radius.circular(deviceWidth * 0.08),
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Tasks',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: deviceWidth * 0.06,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: deviceWidth * 0.06),
                      child: CircularPercentIndicator(
                        radius: deviceWidth * 0.1,
                        lineWidth: deviceWidth * 0.02,
                        percent: 0.6,
                        footer: Text(
                          'tasks progress',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: deviceWidth * 0.04,
                          ),
                        ),
                        center: Text("60%",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: deviceWidth * 0.05, color: Colors.white)),
                        backgroundColor: Colors.grey,
                        progressColor: Colors.greenAccent,
                        startAngle: 0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top, left: deviceWidth * 0.05, right: deviceWidth * 0.08),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Center(
                child: Container(
                  height: deviceHeight * 0.2,
                  width: deviceWidth * 0.85,
                  decoration: BoxDecoration(
                    color: const Color(0x40EA51D2),
                    borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                  ),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset(
                          'assets/smartwatch.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: deviceWidth * 0.05),
                              child: Text(
                                "Device Connected",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: deviceWidth * 0.05,
                                ),
                              ),
                            ),
                            SliderButton(
                              width: deviceWidth * 0.4,
                              height: deviceHeight * 0.08,
                              backgroundColor: const Color(0x76A7F8FF),
                              action: () {},
                              dismissible: false,
                              dismissThresholds: 0.6,
                              label: Text(
                                "Connect",
                                style: TextStyle(
                                  color: const Color(0xff4a4a4a),
                                  fontWeight: FontWeight.w500,
                                  fontSize: deviceWidth * 0.045,
                                ),
                              ),
                              icon: Icon(
                                Icons.watch,
                                color: Colors.black,
                                size: deviceWidth * 0.1,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
