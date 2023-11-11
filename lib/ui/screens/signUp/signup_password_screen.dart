import 'package:flutter/material.dart';
import 'package:health_app/ui/widgets/loading_request.dart';

class SignUpPassword extends StatefulWidget {
  final TabController tabController;
  const SignUpPassword({Key? key, required this.tabController}) : super(key: key);

  @override
  State<SignUpPassword> createState() => _SignUpPasswordState();
}

class _SignUpPasswordState extends State<SignUpPassword> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  String textError = '';
  bool passwordMatch = true;
  bool passwordEmpty = false;
  bool _loading = false;
  @override
  void initState() {
    super.initState();
    textError = '';
    passwordMatch = true;
    passwordEmpty = false;
    _loading = false;
  }

  bool validatePassword() {
    setState(() {
      textError = '';
      passwordMatch = true;
      passwordEmpty = false;
    });
    String password = passwordController.text;
    String confirmPassword = confirmPasswordController.text;
    if (password == '') {
      setState(() {
        passwordEmpty = true;
      });
      return false;
    }

    String pattern = r'^(?=.*[A-Z])(?=.*\d).{8,}$';
    RegExp regex = RegExp(pattern);
    if (regex.hasMatch(password)) {
      if (password != confirmPassword) {
        setState(() {
          passwordMatch = false;
        });
        return false;
      }
      return true;
    } else {
      setState(() {
        textError =
            "Your password must contain at least 8 characters \nincluding at least one uppercase letter and number ";
      });
      return false;
    }
  }

  void continueCallback() {
    if (validatePassword()) {
      setState(() {
        _loading = true;
      });

      ///call with back
      setState(() {
        _loading = false;
      });
      widget.tabController.index = 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: deviceHeight * 0.05,
            ),
            Text(
              'Your Password : ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: deviceWidth * 0.06,
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.03,
            ),
            SizedBox(
              width: deviceWidth * 0.8,
              height: deviceHeight * 0.08,
              child: TextField(
                maxLines: 1,
                minLines: 1,
                autofocus: false,
                controller: passwordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  icon: Icon(Icons.password_sharp, color: Colors.green, size: deviceWidth * 0.06),
                  hintText: "Password",
                  hintStyle: TextStyle(
                    fontSize: deviceWidth * 0.04,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: passwordEmpty || textError != '' ? Colors.red : Colors.green),
                    borderRadius: BorderRadius.circular(deviceWidth * 0.03),
                    gapPadding: 0,
                  ),
                  fillColor: Colors.white,
                  errorMaxLines: 1,
                  isDense: true,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(color: passwordEmpty || textError != '' ? Colors.red : Colors.black, width: 2),
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
              height: deviceHeight * 0.01,
            ),
            SizedBox(
              width: deviceWidth * 0.8,
              height: deviceHeight * 0.08,
              child: TextField(
                maxLines: 1,
                minLines: 1,
                autofocus: false,
                controller: confirmPasswordController,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  icon: Icon(Icons.password, color: Colors.green, size: deviceWidth * 0.06),
                  hintText: "Confirm Password",
                  hintStyle: TextStyle(
                    fontSize: deviceWidth * 0.04,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: passwordMatch ? Colors.green : Colors.red),
                    borderRadius: BorderRadius.circular(deviceWidth * 0.03),
                    gapPadding: 0,
                  ),
                  fillColor: Colors.white,
                  errorMaxLines: 1,
                  isDense: true,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: passwordMatch ? Colors.black : Colors.red, width: 2),
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
            Visibility(
              visible: textError != "",
              child: Center(
                child: Text(
                  textError,
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
                  width: deviceWidth * 0.4,
                  decoration: BoxDecoration(
                    color: const Color(0xFF2E9965),
                    borderRadius: BorderRadius.all(
                      Radius.circular(deviceWidth * 0.05),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: deviceWidth * 0.06),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        if (_loading) const LoadingRequest()
      ],
    );
  }
}
