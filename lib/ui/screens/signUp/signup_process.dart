import 'package:flutter/material.dart';
import 'package:health_app/ui/screens/signUp/signup_birthday_screen.dart';
import 'package:health_app/ui/screens/signUp/signup_info_screen.dart';
import 'package:health_app/ui/screens/signUp/signup_name_screen.dart';
import 'package:health_app/ui/screens/signUp/signup_password_screen.dart';

import 'signup_email_screen.dart';

class SignUpProcess extends StatefulWidget {
  const SignUpProcess({Key? key}) : super(key: key);

  @override
  State<SignUpProcess> createState() => _SignUpProcessState();
}

class _SignUpProcessState extends State<SignUpProcess> with TickerProviderStateMixin {
  late TabController _tabController;
  int _currentIndex = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(vsync: this, length: 5);
    _tabController.index = 0;
    _currentIndex = 0;
    _tabController.addListener(_listenController);
  }

  void _listenController() {
    setState(() {
      _currentIndex = _tabController.index;
    });
  }

  List<Widget> _buildSignUpProcessChildren() {
    return [
      SignUpEmail(tabController: _tabController),
      SignUpPassword(tabController: _tabController),
      SignUpName(tabController: _tabController),
      SignUpBirthday(tabController: _tabController),
      SignUpInfo(tabController: _tabController),
    ];
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 50),
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom == 0 ? 0 : deviceHeight * 0.3),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                height: deviceHeight * 0.55,
                width: deviceWidth,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(deviceWidth * 0.1),
                    topLeft: Radius.circular(deviceWidth * 0.1),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: deviceWidth * 0.06),
                  child: Column(
                    children: [
                      SizedBox(
                        height: deviceHeight * 0.04,
                      ),
                      Center(
                        child: Row(
                          children: [
                            Visibility(
                              visible: _currentIndex != 0,
                              child: GestureDetector(
                                onTap: () {
                                  _tabController.index--;
                                },
                                child: Container(
                                  width: deviceWidth * 0.09,
                                  height: deviceWidth * 0.09,
                                  decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: _currentIndex != 0 ? deviceWidth * 0.1 : deviceWidth * 0.15,
                            ),
                            Container(
                              padding: EdgeInsets.only(left: deviceWidth * 0.05),
                              child: Center(
                                child: Stack(children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      width: deviceWidth * 0.5,
                                      height: deviceWidth * 0.013,
                                      decoration: BoxDecoration(
                                        color: Colors.grey,
                                        borderRadius: BorderRadius.circular(deviceWidth * 0.5),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: AnimatedContainer(
                                      duration: const Duration(milliseconds: 250),
                                      width: (deviceWidth * 0.5 / 5) * (_currentIndex + 1),
                                      height: deviceWidth * 0.013,
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(deviceWidth * 0.5),
                                      ),
                                    ),
                                  ),
                                ]),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: deviceWidth * 0.1,
                      ),
                      SizedBox(
                        height: deviceHeight * 0.4,
                        width: deviceWidth,
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _tabController,
                          children: _buildSignUpProcessChildren(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
