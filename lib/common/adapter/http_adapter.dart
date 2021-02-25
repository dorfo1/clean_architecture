import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class HttpAdapter {
  final Dio _dio;

  HttpAdapter(this._dio);

  Future call({
      @required HttpMethod method,
      @required String urlPath,
      Map<String, dynamic> body}) async {
    switch (method) {
      case HttpMethod.GET:
        return await get(urlPath);
        break;
      case HttpMethod.POST:
        return await post(urlPath: urlPath, body: body);
        break;
      case HttpMethod.PUT:
        return await put(urlPath: urlPath, body: body);
        break;
      case HttpMethod.DELETE:
        return await delete(urlPath: urlPath, body: body);
        break;
    }
  }

  Future<Response> get(String urlPath) async {
    return await _dio.get(urlPath);
  }

  Future<Response> post({@required String urlPath, Map<String, dynamic> body}) async {
    return await _dio.post(urlPath, data: body ?? null);
  }

  Future<Response> put({@required String urlPath, Map<String, dynamic> body}) async {
    return await _dio.put(urlPath, data: body ?? null);
  }

  Future<Response> delete({@required String urlPath, Map<String, dynamic> body}) async {
    return await _dio.delete(urlPath, data: body ?? null);
  }
}

enum HttpMethod { GET, POST, PUT, DELETE }
