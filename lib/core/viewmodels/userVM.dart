import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:health_app/core/models/patient.dart';
import 'package:health_app/core/services/user_service.dart';

import '../services/auth_services.dart';

class UserViewModel extends ChangeNotifier {
  final AuthService _authService = GetIt.instance<AuthService>();
  final UserService _userService = GetIt.instance<UserService>();
  late PatientModel? patien;

  Future<void> loginWithEmailPassword(String email, String password) async {
    try {
      patien = await _authService.loginViaEmailAndPassword(email, password);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<void> createPatient(PatientModel patient, String password) async {
    var body = patient.toJson();
    body.addAll({"password": password});
    await _userService.createUser(body);
  }
}
