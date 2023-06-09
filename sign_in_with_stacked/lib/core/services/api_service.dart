import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sign_in_with_stacked/app/app.logger.dart';
import 'package:sign_in_with_stacked/ui/common/constants.dart';

final log = getLogger('ApiService');

class ApiService {
  Future<void> getUser() async {}

  Future<dynamic> getOtp({required String email}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$url/auth/send-otp'),
        body: {'is_email': true, 'receiver': email},
      );
      return response;
    } catch (e) {
      log.d(e);
      return null;
    }
  }

  Future<dynamic> signUpUser({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
    required String code,
  }) async {
    try {
      http.Response response = await http.post(
        body: jsonEncode({
          'email': email,
          'password': password,
          'firstName': firstName,
          'lastName': lastName,
          'code': code,
        }),
        Uri.parse(
          ('$url/auth/register'),
        ),
      );
      log.i(response.body);
      return response;
    } catch (e) {
      log.d(e);
      return null;
    }
  }

  Future<dynamic> sigInUsers(
      {required String email, required String password}) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$url/auth/login'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: {'Content-Type': 'application/json'},
      );
      log.i(response.body);
    } catch (e) {
      log.i(e.toString());
    }
  }
}
