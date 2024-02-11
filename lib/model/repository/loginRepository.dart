import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hrms/model/dataModel/login/loginResponse.dart';
import 'package:hrms/viewModel/InterceptorHttp.dart';
import 'package:hrms/viewModel/interceptor.dart';

var dio = Dio();
var headers = {'Content-Type': 'application/json'};

class LoginRepository {
  final String _loginUrl =
      "https://backend.evently.adityachoudhury.com/api/auth/login";

  final String _generateUrl =
      "https://backend.evently.adityachoudhury.com/api/auth/generate";
  final String _verifyUrl =
      "https://backend.evently.adityachoudhury.com/api/auth/verify";

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
    dio.interceptors.add(DioInterceptor());
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
        return LoginResponse.withError(
            'Internal Server Error: Try Again Later');
      }
    } catch (e) {
      print("The Error is :- ${e.toString()}");
      return LoginResponse.withError('Internal Server Error: Try Again Later');
    }
  }

  Future<bool> verify(
      {required String otp, required LoginResponse loginResponse}) async {
    dio.interceptors.add(DioInterceptor());
    var verifyHeader = {
      'Content-Type': 'application/json',
    };
    var data = json.encode({"otp": otp});

    try {
      var response = await dio.request(
        _verifyUrl,
        options: Options(method: 'POST', headers: verifyHeader),
        data: data,
      );

      print("The Status code is :- ${response.statusCode}");
      if (response.statusCode == 200) {
        var value = await storage.read(key: 'loginResponse');
        var newRes = LoginResponse.fromMap(json.decode(value!));
        var verifiedResponse = LoginResponse.withVerification(newRes);
        await storage.write(
            key: 'loginResponse', value: json.encode(verifiedResponse.toMap()));
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      print(e.toString());
      return false;
    } catch (e) {
      print(e.toString());
      return false;
    }
  }

  Future<bool> sendotp(LoginResponse loginResponse) async {
    dio.interceptors.add(DioInterceptor());
    try {
      var response = await dio.request(
        _generateUrl,
        options: Options(method: 'POST'),
      );

      print("The Status code is :- ${response.statusCode}");
      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      return false;
    } catch (e) {
      return false;
    }
  }
}
