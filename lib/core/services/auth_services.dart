import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health_app/core/models/patient.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../common/request_header_interceptor.dart';

class AuthService {
  final dioWithToken = Dio();
  final dioWithNoToken = Dio();
  late final SharedPreferences prefs;
  final _storage = const FlutterSecureStorage();
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    scopes: [
      'email',
      'profile',
      'openid',
      'https://www.googleapis.com/auth/user.birthday.read',
      'https://www.googleapis.com/auth/user.gender.read',
    ],
  );
  String? _accessToken;
  String? _refreshToken;
  Future<void> init() async {
    try {
      _accessToken = await _storage.read(key: '_accessToken');
      _refreshToken = await _storage.read(key: '_refreshToken');

      if (_accessToken != null) {
        dioWithToken.interceptors.addAll([
          RequestHeaderInterceptor(accessToken: _accessToken!),
        ]);
      }

      if (_accessToken != null && _refreshToken != null) {
        saveTokenLocally();
      } else {
        _accessToken = null;
        _refreshToken = null;
        saveTokenLocally();
      }
    } catch (exception) {
      removeUserData();
    }
  }

  Future<void> saveTokenLocally() async {
    await _storage.write(key: '_accessToken', value: _accessToken);

    await _storage.write(key: '_refreshToken', value: _refreshToken);
  }

  void removeUserData() {
    _accessToken = null;
    _refreshToken = null;
    _storage.delete(key: '_accessToken');
    _storage.delete(key: '_refreshToken');
  }

  Future<PatientModel?> loginViaEmailAndPassword(String email, String password) async {
    try {
      Response response = await dioWithNoToken.post(
        'url/auth/login',
        data: {
          'email': email,
          'password': password,
        },
      );

      return await loginTraitement(response);
    } on DioException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<PatientModel?> loginViaGoogle() async {
    try {
      Map<String, dynamic>? userData = {};

      final google = await _googleSignIn.signIn();
      var auth = await google?.authentication;

      if (auth?.idToken != null) {
        Response response = await dioWithNoToken.post('url/auth/login-with-google', data: {
          'googleToken': auth?.idToken,
        });
        await loginTraitement(response);

        var headers = await google?.authHeaders;
        var googleResponse = await dioWithNoToken.get(
            'https://people.googleapis.com/v1/people/me'
            '?personFields=birthdays,genders,addresses,emailAddresses,locations,nicknames,names,phoneNumbers',
            options: Options(
              headers: headers,
            ));
        var data = googleResponse.data;
        String? firstName;
        String? lastName;

        lastName = data['names'][0]['familyName'];
        firstName = data['names'][0]['givenName'];

        String? gender;

        if (data['genders'] != null) {
          gender = data['genders'][0]['value'];
        }

        int? birthdayYear, birthdayMonth, birthdayDay;
        DateTime? birthday;

        if (data['birthdays'] != null) {
          birthdayYear = data['birthdays'][1]?['date']['year'] ?? '';
          birthdayMonth = data['birthdays'][1]?['date']['month'] ?? '';
          birthdayDay = data['birthdays'][1]?['date']['day'] ?? '';

          if (birthdayYear != null && birthdayMonth != null && birthdayDay != null) {
            birthday = DateTime(birthdayYear, birthdayMonth, birthdayDay);
          }
        }

        userData.addAll({
          "firstName": firstName,
          "lastName": lastName,
        });
        if (gender != null && (gender == "male" || gender == "female")) {
          userData.addAll({
            "gender": gender == "male" ? 0 : 1,
          });
        }
        if (birthday != null) {
          userData.addAll({
            "birthday": "$birthdayMonth/$birthdayDay/$birthdayYear",
          });
        }

        return PatientModel.fromJson(userData);
      }
    } on DioException catch (exception) {
      if (kDebugMode) {
        print(exception.toString());
      }
    }
  }

  Future<PatientModel?> loginTraitement(Response response) async {
    _accessToken = response.data["data"]["access_token"];
    _refreshToken = response.data["data"]["refresh_token"];

    await saveTokenLocally();

    return PatientModel.fromJson(response.data["data"]);
  }
}
