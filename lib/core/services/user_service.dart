import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:health_app/core/models/doctor.dart';

import 'auth_services.dart';

class UserService {
  UserService();

  final AuthService _authService = GetIt.instance<AuthService>();

  var dio = Dio();

  Future<bool> createPatient(body) async {
    try {
      await dio.post('http://192.168.90.153:3000/auth/signup/patient', data: body);
      return true;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return false;
    }
  }

  Future<List<DoctorModel>?> getDoctors() async {
    try {
      Response response = await dio.get(
        'http://192.168.90.153:3000/doctor',
        options: Options(
          headers: {'Authorization': 'Bearer ${_authService.accessToken!}'},
        ),
      );
      if (response.statusCode! > 299) {
        return null;
      }
      List<DoctorModel> doctors = (response.data["data"] as List<dynamic>).map((e) => DoctorModel.fromJson(e)).toList();
      return doctors;
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }
}
