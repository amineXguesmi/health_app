import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:health_app/core/models/doctor.dart';
import 'package:health_app/core/models/patient.dart';
import 'package:health_app/core/services/user_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../services/auth_services.dart';

class UserViewModel extends ChangeNotifier {
  final AuthService _authService = GetIt.instance<AuthService>();
  final UserService _userService = GetIt.instance<UserService>();
  late final SharedPreferences prefs;
  PatientModel? patient;
  List<DoctorModel>? doctors;

  Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
    if (prefs.getString('email') != null) {
      String? email = prefs.getString('email');
      String? firstName = prefs.getString('firstName');
      String? lastName = prefs.getString('lastName');
      String? gender = prefs.getString('gender');
      String? age = prefs.getString('age');
      String? height = prefs.getString('height');
      String? phoneNumber = prefs.getString('number');
      patient = PatientModel(
          firstName: firstName ?? "amine",
          lastName: lastName ?? "gasmi",
          height: int.parse(height!) ?? 180,
          gender: gender ?? 'MALE',
          phoneNumber: phoneNumber ?? '12345678',
          email: email ?? 'amine@gmail.com',
          age: int.parse(age!) ?? 21);
    }
  }

  Future<bool> loginWithEmailPassword(String email, String password) async {
    try {
      patient = await _authService.loginViaEmailAndPassword(email, password);
      if (patient == null) {
        return false;
      }
      prefs.setString('email', patient!.email);
      prefs.setString('firstName', patient!.firstName);
      prefs.setString('lastName', patient!.lastName);
      prefs.setString('age', patient!.age.toString());
      prefs.setString('height', patient!.height.toString());
      prefs.setString('gender', patient!.gender);
      prefs.setString('number', patient!.phoneNumber);
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<bool> createPatient() async {
    var body = patient?.toJson();
    return await _userService.createPatient(body);
  }

  Future<bool> getDoctors() async {
    doctors = await _userService.getDoctors();
    if (doctors == null) {
      return false;
    } else {
      return true;
    }
  }
}
