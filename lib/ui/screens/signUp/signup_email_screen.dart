import 'package:flutter/material.dart';
import 'package:health_app/ui/widgets/loading_request.dart';

class SignUpEmail extends StatefulWidget {
  final TabController tabController;
  const SignUpEmail({Key? key, required this.tabController}) : super(key: key);

  @override
  State<SignUpEmail> createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController confirmEmailController = TextEditingController();
  String _emailError = '';
  bool _emailMatch = true;
  bool _emailEmpty = false;
  bool _loading = false;
  @override
  void initState() {
    super.initState();
    _emailError = '';
    _emailMatch = true;
    _emailEmpty = false;
    _loading = false;
  }

  bool validateEmail() {
    setState(() {
      _emailError = '';
      _emailMatch = true;
      _emailEmpty = false;
    });

    String email = emailController.text;
    String confirmEmail = confirmEmailController.text;
    if (email == '') {
      setState(() {
        _emailEmpty = true;
      });
      return false;
    }
    String emailPattern = r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$'; // Basic email pattern
    RegExp emailRegex = RegExp(emailPattern);

    if (emailRegex.hasMatch(email)) {
      if (email != confirmEmail) {
        setState(() {
          _emailMatch = false;
        });
        return false;
      }
      return true;
    } else {
      setState(() {
        _emailError = 'Enter a valid email address';
      });
      return false;
    }
  }

  void continueCallback() {
    if (validateEmail()) {
      setState(() {
        _loading = true;
      });

      ///call with back
      setState(() {
        _loading = false;
      });
      widget.tabController.index = 1;
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
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: deviceHeight * 0.05,
              ),
              Text(
                'Your Email Address : ',
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
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    icon: Icon(Icons.alternate_email, color: Colors.green, size: deviceWidth * 0.06),
                    hintText: "Email",
                    hintStyle: TextStyle(
                      fontSize: deviceWidth * 0.04,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: _emailEmpty || _emailError != '' ? Colors.red : Colors.green),
                      borderRadius: BorderRadius.circular(deviceWidth * 0.03),
                      gapPadding: 0,
                    ),
                    fillColor: Colors.white,
                    errorMaxLines: 1,
                    isDense: true,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: _emailEmpty || _emailError != '' ? Colors.red : Colors.black, width: 2),
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
                  controller: confirmEmailController,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    icon: Icon(Icons.alternate_email, color: Colors.green, size: deviceWidth * 0.06),
                    hintText: "Confirm Email",
                    hintStyle: TextStyle(
                      fontSize: deviceWidth * 0.04,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: _emailMatch ? Colors.green : Colors.red),
                      borderRadius: BorderRadius.circular(deviceWidth * 0.03),
                      gapPadding: 0,
                    ),
                    fillColor: Colors.white,
                    errorMaxLines: 1,
                    isDense: true,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: _emailMatch ? Colors.black : Colors.red, width: 2),
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
                visible: _emailError.isNotEmpty,
                child: Center(
                  child: Text(
                    _emailError,
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
          if (_loading) const LoadingRequest(),
        ],
      ),
    );
  }
}
