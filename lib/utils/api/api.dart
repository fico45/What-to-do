import 'package:curl_logger_dio_interceptor/curl_logger_dio_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:what_to_do/utils/tokens.dart';

class Api {
  get dio => createDio();

  Api._internal();
  static final _api = Api._internal();

  factory Api() => _api;

  Dio createDio() {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: Tokens.supabaseUrl,
        receiveTimeout: const Duration(seconds: 15), // 15 seconds
        connectTimeout: const Duration(seconds: 15),
        sendTimeout: const Duration(seconds: 15),
      ),
    );

    if (kDebugMode) {
      dio.interceptors.add(
        CurlLoggerDioInterceptor(printOnSuccess: true),
      );
    }
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          handler.next(response);
        },
        onError: (DioException dioError, handler) async {
          if (dioError.response?.statusCode == 401) {
            //potential logout?
            return handler.reject(dioError);
          } //continue
          else {
            return handler.next(dioError);
          }
        },
      ),
    );

    return dio;
  }

  static Future get(String url, [Options? options]) async {
    return await _api.dio.get(url, options: options);
  }

  static Future post(String url, var data, [Options? options]) async {
    return await _api.dio.post(url, data: data, options: options);
  }

  static Future put(String url, var data, [Options? options]) async {
    return await _api.dio.put(url, data: data, options: options);
  }

  static Future delete(String url, [var data, Options? options]) async {
    return await _api.dio.delete(url, data: data, options: options);
  }

  static Future patch(String url, [var data, Options? options]) async {
    return await _api.dio.patch(url, data: data, options: options);
  }

  static void clearHeader() async {
    _api.dio.options.headers.clear();
  }
}
