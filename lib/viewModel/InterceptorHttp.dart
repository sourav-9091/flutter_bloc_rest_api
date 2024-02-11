import 'package:dio/dio.dart';

class DioInterceptorHttp extends Interceptor {
  final dio = Dio(BaseOptions(baseUrl: ""));

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    options.headers.addAll({
      "Content-Type": "application/json"
    });
    handler.next(options);
  }
}
