import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

import 'auth_services.dart';

class UserService {
  UserService();

  final AuthService _authService = GetIt.instance<AuthService>();

  var dio = Dio();

  Future<void> createUser(body) async {
    try {
      await dio.put('url/user/update-geolocation',
          data: body,
          options: Options(
              headers: {'Content-Type': 'application/json', 'Authorization': 'Bearer $_authService.accessToken'}));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
}
