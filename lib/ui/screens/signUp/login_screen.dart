import 'package:flutter/material.dart';
import 'package:health_app/core/viewmodels/userVM.dart';
import 'package:health_app/ui/screens/main_screen.dart';
import 'package:health_app/ui/screens/signUp/signup_process.dart';
import 'package:provider/provider.dart';

import '../../widgets/loading_request.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _emailEmpty = false;
  bool _loading = false;
  String _textError = '';
  bool _passwordEmpty = false;
  bool bottomSheetHeight = true;
  @override
  void initState() {
    super.initState();
    bottomSheetHeight = true;
    _textError = '';
    _emailEmpty = false;
    _loading = false;
    _passwordEmpty = false;
  }

  bool validatePassword() {
    setState(() {
      _textError = '';
      _passwordEmpty = false;
    });
    String password = passwordController.text;
    if (password == '') {
      setState(() {
        _passwordEmpty = true;
      });
      return false;
    }

    String pattern = r'^(?=.*[A-Z])(?=.*\d).{8,}$';
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(password)) {
      return true;
    } else {
      setState(() {
        _textError = "invalid password ";
      });
      return false;
    }
  }

  bool validateEmail() {
    setState(() {
      _emailEmpty = false;
    });

    String email = emailController.text;
    if (email == '') {
      setState(() {
        _emailEmpty = true;
      });
      return false;
    }
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'; // Basic email pattern
    RegExp emailRegex = RegExp(emailPattern);

    if (emailRegex.hasMatch(email)) {
      return true;
    } else {
      setState(() {
        _textError = 'Enter a valid email address';
      });
      return false;
    }
  }

  Future<void> continueCallback() async {
    if (validateEmail()) {
      if (validatePassword()) {
        setState(() {
          _loading = true;
        });
        bool result =
            await context.read<UserViewModel>().loginWithEmailPassword(emailController.text, passwordController.text);
        await Future.delayed(const Duration(milliseconds: 200));
        setState(() {
          _loading = false;
        });
        if (result && context.mounted) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const MainScreen(),
            ),
          );
        } else if (context.mounted) {
          showDialog(
              context: context,
              builder: (context) => const AlertDialog(
                    title: Center(
                      child: Text(
                        'error',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 40,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    content: Text(
                      'error happen where sign up please try log in again ',
                    ),
                  ));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: !_loading
          ? AnimatedPadding(
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
                                  controller: emailController,
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
                                      borderSide: BorderSide(color: _emailEmpty ? Colors.red : Colors.black, width: 2),
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
                                  controller: passwordController,
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
                                      borderSide:
                                          BorderSide(color: _passwordEmpty ? Colors.red : Colors.black, width: 2),
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
                              Visibility(
                                visible: _textError != '',
                                child: Center(
                                  child: Text(
                                    _textError,
                                    style: TextStyle(
                                      color: Colors.red,
                                      fontSize: deviceWidth * 0.03,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: deviceHeight * 0.01,
                              ),
                              GestureDetector(
                                onTap: continueCallback,
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
                                  children: [
                                    Image.asset('assets/google_icon.png'),
                                    const Text('  Google'),
                                  ],
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
            )
          : const LoadingRequest(),
    );
  }
}
