import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import './interceptors.dart';

class HttpAPI {
  static final HttpAPI _instance = HttpAPI._internal();

  factory HttpAPI() => _instance;
  static late final Dio _dio;

  HttpAPI._internal() {
    _dio = Dio();
    _dio.interceptors.add(const Interceptor());

    if (kDebugMode) {
      _dio.interceptors
          .add(LogInterceptor(requestBody: true, responseBody: true));

      // 添加代理
      // _dio.httpClientAdapter =
      //     IOHttpClientAdapter(createHttpClient: proxyHttpClient);
    }
  }

  Future<Response<T>> get<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken}) {
    return _dio.get(path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);
  }

  Future<Response<T>> post<T>(String path,
      {Map<String, dynamic>? queryParameters,
      Object? data,
      Options? options,
      CancelToken? cancelToken}) {
    return _dio.post(path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken);
  }
}
