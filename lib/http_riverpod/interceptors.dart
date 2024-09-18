import 'dart:io';

import 'package:dio/dio.dart';

class Interceptors extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    print(options.toString());
    super.onRequest(options, handler);
  }
}

HttpClient proxyHttpClient() {
  return HttpClient()
    ..findProxy = (uri) {
      return 'PROXY 127.0.0.1:1080';
    }
    ..badCertificateCallback =
        (X509Certificate cert, String host, int port) => true;
}
