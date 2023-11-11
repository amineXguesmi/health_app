import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool task1 = false;
  bool task2 = false;
  bool task3 = false;
  bool task4 = false;
  bool task5 = false;
  bool task6 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height * 0.85,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).padding.top,
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Text('Hello, Mr. John Doe', style: Theme.of(context).textTheme.titleLarge),
              ),
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Text(
                  'Upcoming Appointment',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.red),
                ),
              ),
              Center(
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFCF6F80),
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
                padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
                child: Text(
                  'Today\'s Tasks',
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.red),
                ),
              ),
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Column(
                    children: [
                      ListTile(
                        leading: Checkbox(
                          value: task1,
                          onChanged: (value) {
                            setState(() {
                              task1 = value!;
                            });
                          },
                          activeColor: Colors.red,
                        ),
                        title: Text(
                          'Take Medicine',
                          style: TextStyle(
                            decoration: task1 ? TextDecoration.lineThrough : TextDecoration.none,
                          ),
                        ),
                        subtitle: Text('10:00 AM'),
                      ),
                      ListTile(
                        leading: Checkbox(
                          value: task2,
                          onChanged: (value) {
                            setState(() {
                              task2 = value!;
                            });
                          },
                          activeColor: Colors.red,
                        ),
                        title: Text(
                          'Mesure Blood Pressure',
                          style: TextStyle(
                            decoration: task2 ? TextDecoration.lineThrough : TextDecoration.none,
                          ),
                        ),
                        subtitle: Text('12:00 AM'),
                      ),
                      ListTile(
                        leading: Checkbox(
                          value: task3,
                          onChanged: (value) {
                            setState(() {
                              task3 = value!;
                            });
                          },
                          activeColor: Colors.red,
                        ),
                        title: Text(
                          'walk 1 mile',
                          style: TextStyle(
                            decoration: task3 ? TextDecoration.lineThrough : TextDecoration.none,
                          ),
                        ),
                        subtitle: Text('2:00 PM'),
                      ),
                      ListTile(
                        leading: Checkbox(
                          value: task4,
                          onChanged: (value) {
                            setState(() {
                              task4 = value!;
                            });
                          },
                          activeColor: Colors.red,
                        ),
                        title: Text(
                          'Drink 10 glasses of water',
                          style: TextStyle(
                            decoration: task4 ? TextDecoration.lineThrough : TextDecoration.none,
                          ),
                        ),
                        subtitle: Text('4:00 PM'),
                      ),
                      ListTile(
                        leading: Checkbox(
                          value: task5,
                          onChanged: (value) {
                            setState(() {
                              task5 = value!;
                            });
                          },
                          activeColor: Colors.red,
                        ),
                        title: Text(
                          'WAke up early',
                          style: TextStyle(
                            decoration: task5 ? TextDecoration.lineThrough : TextDecoration.none,
                          ),
                        ),
                        subtitle: Text('6:00 AM'),
                      ),
                      ListTile(
                        leading: Checkbox(
                          value: task6,
                          onChanged: (value) {
                            setState(() {
                              task6 = value!;
                            });
                          },
                          activeColor: Colors.red,
                        ),
                        title: Text(
                          'Sleep early',
                          style: TextStyle(
                            decoration: task6 ? TextDecoration.lineThrough : TextDecoration.none,
                          ),
                        ),
                        subtitle: Text('10:00 PM'),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
