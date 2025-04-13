import 'package:dio/dio.dart';

class DioHelper {
  final Dio dio;

  DioHelper({
    required baseUrl,
    Duration? connectTimeout,
    Duration? receiveTimeout,
  }) : dio = Dio(BaseOptions(
            connectTimeout: connectTimeout ?? Duration(seconds: 60),
            receiveTimeout: receiveTimeout ?? Duration(seconds: 60),
            baseUrl: baseUrl,
            contentType: 'application/json',
            responseType: ResponseType.json))
          ..interceptors.add(LogInterceptor(
            request: false,
            requestHeader: false,
            requestBody: true,
            responseBody: true,
            responseHeader: false,
          ));
}
