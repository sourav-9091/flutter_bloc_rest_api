import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hrms/model/dataModel/login/loginResponse.dart';

class DioInterceptor extends Interceptor {
  final dio = Dio(BaseOptions(baseUrl: ""));
  final storage = FlutterSecureStorage();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final res = await storage.read(key: 'loginResponse') as String;

    LoginResponse loginResponse = LoginResponse.fromMap(json.decode(res));
    options.headers.addAll({
      "Content-Type": "application/json",
      'Cookie':
          'refreshToken=${loginResponse.backendTokens.refreshToken}; token=${loginResponse.backendTokens.token}'
    });
    handler.next(options);
  }

  // void onError(DioException err, ErrorInterceptorHandler handler) async {
  //   if (err.response?.statusCode == 401) {
  //     await refreshToken();
  //     try {
  //       handler.resolve(await _retry(err.requestOptions));
  //     } on DioException catch (e) {
  //       handler.next(e);
  //     }
  //     return;
  //   }
  //   handler.next(err);
  // }

  // Future<void> refreshToken() async {
  //   final res = await storage.read(key: 'loginResponse') as String;

  //   LoginResponse loginResponse = LoginResponse.fromMap(json.decode(res));
  //   var response = await dio.post(
  //       "https://backend.evently.adityachoudhury.com/api/auth/refresh",
  //       options: Options(headers: {
  //         "Refresh-Token": loginResponse.backendTokens.refreshToken
  //       }));
  //   if (response.statusCode == 200) {
  //     var data = json.decode(response.data);
  //     var newResponse = LoginResponse.withNewAccessToken(
  //         loginResponse, data.token, data.refreshToken);

  //     await storage.write(
  //         key: 'loginResponse', value: json.encode(newResponse.toMap()));
  //   }
  // }

  // Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
  //   final res = await storage.read(key: 'loginResponse') as String;

  //   LoginResponse loginResponse = LoginResponse.fromMap(json.decode(res));
  //   final options = Options(
  //     method: requestOptions.method,
  //     headers: {
  //       "Content-Type": "application/json",
  //       'Cookie':
  //           'refreshToken=${loginResponse.backendTokens.refreshToken}; token=${loginResponse.backendTokens.token}'
  //     },
  //   );
  //   return dio.request<dynamic>(requestOptions.path,
  //       data: requestOptions.data,
  //       queryParameters: requestOptions.queryParameters,
  //       options: options);
  // }
}
