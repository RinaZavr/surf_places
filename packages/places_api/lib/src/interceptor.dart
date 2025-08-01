import 'package:dio/dio.dart';
import 'package:places_api/api_client.dart';

class DioInterceptor extends Interceptor {
  DioInterceptor({required DioClient dioClient}) : _dioClient = dioClient;

  final DioClient _dioClient;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Content-Type'] = 'application/json';
    return handler.next(options);
  }
}
