import 'package:flutter/material.dart';
import 'package:health_app/ui/widgets/loading_request.dart';
import 'package:provider/provider.dart';

import '../../../core/viewmodels/userVM.dart';

class SignUpName extends StatefulWidget {
  final TabController tabController;
  const SignUpName({Key? key, required this.tabController}) : super(key: key);

  @override
  State<SignUpName> createState() => _SignUpNameState();
}

class _SignUpNameState extends State<SignUpName> {
  bool nameEmpty = false;
  String nameError = '';
  bool _loading = false;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameEmpty = false;
    nameError = '';
    _loading = false;
  }

  bool validateName() {
    setState(() {
      nameEmpty = false;
    });
    if (nameController.text != '' && nameController.text.length < 9) {
      setState(() {
        nameEmpty = false;
        nameError = '';
      });
      return true;
    } else {
      if (nameController.text == '') {
        setState(() {
          nameEmpty = true;
        });
      } else if (nameController.text.length >= 9) {
        setState(() {
          nameError = 'name length must be no more than 8 character';
        });
      }
      return false;
    }
  }

  void continueCallback() async {
    if (validateName()) {
      setState(() {
        _loading = true;
      });

      context.read<UserViewModel>().patient?.firstName = nameController.text;
      context.read<UserViewModel>().patient?.lastName = lastNameController.text;
      await Future.delayed(const Duration(milliseconds: 200));
      setState(() {
        _loading = false;
      });
      widget.tabController.index = 3;
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
              'Your Name : ',
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
                controller: nameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  icon: Icon(Icons.person, color: Colors.green, size: deviceWidth * 0.06),
                  hintText: "first name",
                  hintStyle: TextStyle(
                    fontSize: deviceWidth * 0.04,
                    fontWeight: FontWeight.w600,
                    color: Colors.black54,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: nameError != '' || nameEmpty ? Colors.red : Colors.green),
                    borderRadius: BorderRadius.circular(deviceWidth * 0.03),
                    gapPadding: 0,
                  ),
                  fillColor: Colors.white,
                  errorMaxLines: 1,
                  isDense: true,
                  filled: true,
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: nameError != '' || nameEmpty ? Colors.red : Colors.black, width: 2),
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
                controller: lastNameController,
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  icon: Icon(Icons.person_outline_rounded, color: Colors.green, size: deviceWidth * 0.06),
                  hintText: "last name",
                  hintStyle: TextStyle(
                    fontSize: deviceWidth * 0.04,
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
              width: deviceWidth * 0.8,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  'Optional',
                  style: TextStyle(
                    fontSize: deviceWidth * 0.04,
                    fontWeight: FontWeight.w300,
                    color: Colors.grey[400],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.01,
            ),
            Visibility(
              visible: nameError.isNotEmpty,
              child: Center(
                child: Text(
                  nameError,
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
