import 'dart:convert';
import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hrms/model/dataModel/login/loginResponse.dart';

var dio = Dio();
var headers = {'Content-Type': 'application/json'};

class LoginRepository {
  final String _loginUrl =
      "https://backend.evently.adityachoudhury.com/api/auth/login";

  final FlutterSecureStorage storage = new FlutterSecureStorage();

  Future<bool> hasToken() async {
    var value = await storage.read(key: 'loginResponse');
    return value != null;
  }

  Future<void> persistLoginResponse(LoginResponse loginResponse) async {
    await storage.write(
        key: 'loginResponse', value: json.encode(loginResponse.toMap()));
  }

  Future<LoginResponse> getLoginResponse() async {
    var value = await storage.read(key: 'loginResponse');
    if (value != null) {
      return LoginResponse.fromMap(json.decode(value));
    } else {
      return LoginResponse.withError("Failed");
    }
  }

  Future<void> deleteToken() async {
    storage.delete(key: 'loginResponse');
  }

  var loginResponse;

  Future<LoginResponse> login(
      {required String username, required String password}) async {
    var data = json.encode({"email": username, "password": password});
    try {
      var response = await dio.request(
        _loginUrl,
        options: Options(
          method: 'POST',
          headers: headers,
        ),
        data: data,
      );
      print("The Status code is :- ${response.statusCode}");
      if (response.statusCode == 200) {
        loginResponse = LoginResponse.fromMap(response.data);
        return loginResponse;
      } else {
        return LoginResponse.withError(
            'Internal Server Error: Try Again Later');
      }
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return LoginResponse.withError('Wrong Password: Try Again');
      } else if (e.response?.statusCode == 404) {
        return LoginResponse.withError('Wrong Username: Try Again');
      } else {
        print("The Error is :- ${e.toString()}");
        return LoginResponse.withError('Internal Server Error: Try Again Later');
      }
    } catch (e) {
      print("The Error is :- ${e.toString()}");
      return LoginResponse.withError('Internal Server Error: Try Again Later');
    }
  }
}