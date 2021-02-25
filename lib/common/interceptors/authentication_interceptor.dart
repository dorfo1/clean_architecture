import 'package:dio/dio.dart';

class AuthenticationInterceptor extends InterceptorsWrapper {
  static const String AUTH_HEADER = "Authorization";
  //TODO COLOQUE TOKEN DO GITHUB AQUI
  static const String AUTH_TOKEN = "Seu token aqui";


  @override
  Future onRequest(RequestOptions options) async {
    options.headers[AUTH_HEADER] = "token $AUTH_TOKEN";
    return options;
  }

  @override
  Future onError(DioError err) async {
    return err;
  }

  @override
  Future onResponse(Response response) async {
    print(response.data);
    return response;
  }
}
