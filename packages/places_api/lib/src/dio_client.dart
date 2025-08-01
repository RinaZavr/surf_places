import 'package:dio/dio.dart';
import 'package:places_api/src/interceptor.dart';

class DioClient {
  DioClient({required String baseUrl, Interceptor? logger}) {
    _dio =
        Dio(
            BaseOptions(
              baseUrl: baseUrl,
              validateStatus: (status) {
                return status != null && status >= 200 && status < 300 ||
                    status == 304;
              },
            ),
          )
          ..interceptors.addAll([
            DioInterceptor(dioClient: this),
            if (logger != null) logger,
          ]);
  }

  late Dio _dio;

  Dio get dio => _dio;
}
