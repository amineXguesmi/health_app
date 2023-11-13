import 'package:flutter/material.dart';
import 'package:health_app/ui/widgets/loading_request.dart';

class DeviceScreen extends StatefulWidget {
  const DeviceScreen({super.key});

  @override
  State<DeviceScreen> createState() => _DeviceScreenState();
}

class _DeviceScreenState extends State<DeviceScreen> {
  bool addDevice = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    addDevice = false;
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: !addDevice
            ? SizedBox(
                height: MediaQuery.of(context).size.height * 0.85,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: deviceHeight * 0.08),
                      Text(
                        'Your Devices',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: deviceWidth * 0.06,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: deviceHeight * 0.02),
                      ListTile(
                        leading: Icon(Icons.watch, color: Colors.green, size: deviceWidth * 0.08),
                        title: Text(
                          'Apple Watch',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: deviceWidth * 0.05,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: CircleAvatar(
                          radius: deviceWidth * 0.05,
                          backgroundColor: Colors.blueGrey,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_forward_ios),
                            onPressed: () {},
                            color: Colors.greenAccent,
                          ),
                        ),
                      ),
                      ListTile(
                        leading: Icon(Icons.scale, color: Colors.green, size: deviceWidth * 0.08),
                        title: Text(
                          'Smart Scale',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: deviceWidth * 0.05,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        trailing: CircleAvatar(
                            radius: deviceWidth * 0.05,
                            backgroundColor: Colors.blueGrey,
                            child: IconButton(
                              icon: const Icon(Icons.arrow_forward_ios),
                              onPressed: () {},
                              color: Colors.greenAccent,
                            )),
                      ),
                      const SizedBox(height: 20),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            addDevice = true;
                          });
                          await Future.delayed(const Duration(milliseconds: 2000));
                          setState(() {
                            addDevice = false;
                          });
                        },
                        child: Container(
                          height: deviceHeight * 0.07,
                          width: deviceWidth * 0.6,
                          decoration: BoxDecoration(
                            color: Colors.greenAccent,
                            borderRadius: BorderRadius.circular(deviceWidth * 0.04),
                          ),
                          child: ListTile(
                            leading: Icon(Icons.add, color: Colors.blueGrey, size: deviceWidth * 0.08),
                            title: Text(
                              'Add a Device',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: deviceWidth * 0.05,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Divider(height: 20, thickness: 1),
                      SizedBox(height: deviceHeight * 0.02),
                      Text(
                        'Shop Devices',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: deviceWidth * 0.06,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 20),
                      GridView(
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.5,
                        ),
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          Card(
                            elevation: 10,
                            color: const Color(0x66EA51D2),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(
                                    width: deviceWidth * 0.2,
                                    'assets/smartwatch.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: deviceWidth * 0.03),
                                    child: Text(
                                      'Smart Watch',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: deviceWidth * 0.04,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            elevation: 10,
                            color: const Color(0x66EA51D2),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(
                                    width: deviceWidth * 0.2,
                                    'assets/band.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: deviceWidth * 0.03),
                                    child: Text(
                                      'Smart Band',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: deviceWidth * 0.04,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            elevation: 10,
                            color: const Color(0x66EA51D2),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(
                                    width: deviceWidth * 0.24,
                                    'assets/smartscale.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: deviceWidth * 0.03),
                                    child: Text(
                                      'smart scale',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: deviceWidth * 0.04,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Card(
                            elevation: 10,
                            color: const Color(0x66EA51D2),
                            child: Stack(
                              children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Image.asset(
                                    width: deviceWidth * 0.2,
                                    'assets/smartSensor.png',
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: deviceWidth * 0.03),
                                    child: Text(
                                      'smart glucose \n meterimage',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600,
                                        fontSize: deviceWidth * 0.04,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            : const LoadingRequest());
  }
}
