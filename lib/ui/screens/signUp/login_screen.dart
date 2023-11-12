import 'package:flutter/material.dart';
import 'package:health_app/ui/screens/signUp/signup_process.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool bottomSheetHeight = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bottomSheetHeight = true;
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: AnimatedPadding(
        duration: const Duration(milliseconds: 50),
        padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom == 0 ? 0 : deviceHeight * 0.3),
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: bottomSheetHeight ? deviceHeight * 0.55 : 0,
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
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: deviceHeight * 0.02,
                        ),
                        Center(
                          child: Text(
                            'Login Account',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: deviceWidth * 0.06,
                              color: Colors.black,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.05,
                        ),
                        SizedBox(
                          width: deviceWidth * 0.8,
                          height: deviceWidth * 0.13,
                          child: TextField(
                            maxLines: 1,
                            minLines: 1,
                            autofocus: false,
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              icon: Icon(Icons.mail, color: Colors.green, size: deviceWidth * 0.06),
                              hintText: "Email Address",
                              hintStyle: TextStyle(
                                fontSize: deviceWidth * 0.03,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(deviceWidth * 0.03),
                                gapPadding: 0,
                              ),
                              fillColor: Colors.white,
                              errorMaxLines: 1,
                              isDense: true,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(deviceWidth * 0.03),
                                gapPadding: 0,
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(deviceWidth * 0.03),
                                gapPadding: 0,
                                borderSide: const BorderSide(color: Colors.transparent),
                              ),
                            ),
                            style: TextStyle(
                              fontSize: deviceWidth * 0.03,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            textAlignVertical: TextAlignVertical.bottom,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.03,
                        ),
                        SizedBox(
                          width: deviceWidth * 0.8,
                          height: deviceWidth * 0.13,
                          child: TextField(
                            maxLines: 1,
                            minLines: 1,
                            autofocus: false,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            decoration: InputDecoration(
                              icon: Icon(Icons.password, color: Colors.green, size: deviceWidth * 0.06),
                              hintText: "Password",
                              hintStyle: TextStyle(
                                fontSize: deviceWidth * 0.03,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54,
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.green),
                                borderRadius: BorderRadius.circular(deviceWidth * 0.03),
                                gapPadding: 0,
                              ),
                              fillColor: Colors.white,
                              errorMaxLines: 1,
                              isDense: true,
                              filled: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.black, width: 2),
                                borderRadius: BorderRadius.circular(deviceWidth * 0.03),
                                gapPadding: 0,
                              ),
                              errorBorder: OutlineInputBorder(
                                gapPadding: 0,
                                borderRadius: BorderRadius.circular(deviceWidth * 0.03),
                                borderSide: const BorderSide(color: Colors.transparent),
                              ),
                            ),
                            style: TextStyle(
                              fontSize: deviceWidth * 0.03,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                            textAlignVertical: TextAlignVertical.bottom,
                            textAlign: TextAlign.left,
                          ),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.03,
                        ),
                        GestureDetector(
                          onTap: () async {},
                          child: Center(
                            child: Container(
                              height: deviceHeight * 0.05,
                              width: deviceWidth * 0.6,
                              decoration: BoxDecoration(
                                color: const Color(0xFF2E9965),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(deviceWidth * 0.03),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(color: Colors.white, fontSize: deviceWidth * 0.06),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: deviceHeight * 0.002,
                              width: deviceWidth * 0.13,
                              color: const Color(0xFF1C6BA4),
                            ),
                            const Text(
                              ' Or sign up with',
                              style: TextStyle(color: Color(0xFF1C6BA4)),
                            ),
                            Container(
                              height: deviceHeight * 0.002,
                              width: deviceWidth * 0.13,
                              color: const Color(0xFF1C6BA4),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: deviceHeight * 0.03,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [Image.asset('assets/google_icon.png'), const Text('  Google')],
                          ),
                        ),
                        SizedBox(
                          height: deviceHeight * 0.03,
                        ),
                        GestureDetector(
                          onTap: () async {
                            setState(() {
                              bottomSheetHeight = false;
                            });
                            await Future.delayed(const Duration(milliseconds: 300));
                            if (context.mounted) {
                              showModalBottomSheet(
                                isScrollControlled: true,
                                barrierColor: Colors.transparent,
                                backgroundColor: Colors.transparent,
                                isDismissible: false,
                                context: context,
                                builder: (context) => const SignUpProcess(),
                              );
                            }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Not register yet ? ',
                                style: TextStyle(color: Color(0xFF1C6BA4)),
                              ),
                              Text(
                                'Create Account ',
                                style: TextStyle(color: Color(0xFF1C6BA4)),
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
      ),
    );
  }
}
