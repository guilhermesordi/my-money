import 'dart:io';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';

mixin AppDio {
  static Future<Dio> getConnection({bool isAuth = false, String? authToken}) async {
    final Dio dio = Dio();

    final Map<String, String> headers = <String, String>{
      "Accept": 'application/json',
      "Content-Type": 'application/json',
    };

    if (isAuth && authToken != null) {
      headers["Authorization"] = "Bearer $authToken";
    }

    dio.options = BaseOptions(
      baseUrl: 'http://10.0.2.2:8080/',
      receiveTimeout: 30000,
      sendTimeout: 15000,
      headers: headers,
    );

    // Para ignorar certificados SSL inválidos
    (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate = (HttpClient client) {
      client.badCertificateCallback = (X509Certificate cert, String host, int port) => false; 
    };

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        onRequest(options);
        handler.next(options);
      },
      onResponse: (response, handler) async {
        onResponse(response, handler);
        handler.next(response);
      },
      onError: (error, handler) async {
        onError(dio, error, handler);
        handler.next(error);
      }),
    );

    return dio;
  }

  static void onRequest(RequestOptions options) {
    print('--------------| Request log |--------------');
    print(options.uri);
  }

  static void onResponse(Response<dynamic> response, ResponseInterceptorHandler handler) {
    print('--------------| Response log |--------------');
    print(response.data);
  }

  static void onError(Dio dio, DioError error, ErrorInterceptorHandler handler) {
    print('--------------| Error log |--------------');
    print(error.response);
  }
}
