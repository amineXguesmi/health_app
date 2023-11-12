import 'package:dio/dio.dart';

class RequestHeaderInterceptor extends Interceptor {
  RequestHeaderInterceptor({
    required this.accessToken,
    this.contentType,
  });

  String accessToken;
  String? contentType;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    options.headers['Authorization'] = 'Bearer $accessToken';

    if (contentType != null) {
      options.headers['Content-Type'] = contentType;
    }

    super.onRequest(options, handler);
  }
}
