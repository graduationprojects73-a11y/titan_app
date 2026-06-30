import 'package:dio/dio.dart';
import 'package:titan/core/services/token_service.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // Get token from storage
    final token = await TokenService.getToken();

    // Add token to headers if available
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    // Handle 401 Unauthenticated
    if (err.response?.statusCode == 401) {
      // Token expired or invalid - clear it
      TokenService.deleteToken();
      // The UI will handle navigation to login
    }

    handler.next(err);
  }
}
