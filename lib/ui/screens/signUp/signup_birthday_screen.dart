import 'package:flutter/material.dart';
import 'package:health_app/ui/widgets/loading_request.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/viewmodels/userVM.dart';

class SignUpBirthday extends StatefulWidget {
  final TabController tabController;

  const SignUpBirthday({Key? key, required this.tabController}) : super(key: key);

  @override
  State<SignUpBirthday> createState() => _SignUpBirthdayState();
}

class _SignUpBirthdayState extends State<SignUpBirthday> {
  TextEditingController dateInput = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  String dateError = '';
  String phoneError = '';
  bool _loading = false;
  @override
  void initState() {
    super.initState();
    dateInput.text = '';
    phoneNumberController.text = '';
    dateError = '';
    phoneError = '';
    _loading = false;
  }

  bool validateData() {
    setState(() {
      dateError = '';
      phoneError = '';
    });

    if (dateInput.text.isEmpty) {
      setState(() {
        dateError = 'Please enter your date of birth';
      });
      return false;
    }

    DateTime currentDate = DateTime.now();
    DateTime selectedDate = DateFormat('yyyy-MM-dd').parse(dateInput.text);

    int age = currentDate.year - selectedDate.year;

    if (age > 100 || age < 18) {
      setState(() {
        dateError = 'You must be between 18 and 100 years old';
      });
      return false;
    }

    if (phoneNumberController.text.length != 8) {
      setState(() {
        phoneError = 'invalid phone number';
      });
      return false;
    }

    return true;
  }

  int calculateAge(DateTime birthDate) {
    DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;

    // Check if the birthday has occurred this year
    if (currentDate.month < birthDate.month ||
        (currentDate.month == birthDate.month && currentDate.day < birthDate.day)) {
      age--;
    }

    return age;
  }

  void continueCallback() async {
    if (validateData()) {
      setState(() {
        _loading = true;
      });
      int age = calculateAge(DateFormat('yyyy-MM-dd').parse(dateInput.text));
      context.read<UserViewModel>().patient?.phoneNumber = phoneNumberController.text;
      context.read<UserViewModel>().patient?.age = age;
      await Future.delayed(const Duration(milliseconds: 200));
      setState(() {
        _loading = false;
      });
      widget.tabController.index = 4;
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
              'Basic Information : ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: deviceWidth * 0.06,
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.02,
            ),
            SizedBox(
              height: deviceHeight * 0.1,
              width: deviceWidth * 0.6,
              child: TextField(
                controller: dateInput,
                decoration: InputDecoration(
                  icon: const Icon(
                    Icons.calendar_today,
                    color: Colors.green,
                  ),
                  labelText: "Enter Date",
                  labelStyle: TextStyle(
                    color: Colors.green,
                    fontSize: deviceWidth * 0.05,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.green),
                    borderRadius: BorderRadius.circular(deviceWidth * 0.03),
                    gapPadding: 0,
                  ),
                ),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate);
                    setState(() {
                      dateInput.text = formattedDate;
                    });
                  }
                },
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.01,
            ),
            SizedBox(
              width: deviceWidth * 0.6,
              child: TextField(
                controller: phoneNumberController,
                maxLines: 1,
                minLines: 1,
                autofocus: false,
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.done,
                decoration: InputDecoration(
                  icon: Icon(Icons.phone, color: Colors.green, size: deviceWidth * 0.06),
                  hintText: "Phone Number",
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
              height: deviceHeight * 0.01,
            ),
            Visibility(
              visible: phoneError.isNotEmpty || dateError.isNotEmpty,
              child: Center(
                child: Text(
                  dateError != '' ? dateError : phoneError,
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: deviceWidth * 0.03,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: deviceHeight * 0.03,
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
