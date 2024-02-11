import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class DioInterceptorHttp extends Interceptor {
  final dio = Dio(BaseOptions(baseUrl: ""));
  final storage = FlutterSecureStorage();

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({"Content-Type": "application/json"});
    handler.next(options);
  }
}
