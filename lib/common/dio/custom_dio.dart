import 'package:clean_architecture/common/interceptors/authentication_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class CustomDio {
  static const String BASE_URL = "https://api.github.com/";
  final AuthenticationInterceptor authInterceptor;

  CustomDio({@required this.authInterceptor});

  call() {
    Dio dio = Dio();
    dio.options.baseUrl = BASE_URL;
    dio.interceptors.add(authInterceptor);
    return dio;
  }
}
