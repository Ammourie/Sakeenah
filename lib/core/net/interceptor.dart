import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO:here we add headers that need to be on all requests like token
    return super.onRequest(options, handler);
  }
}
