import 'package:cobe_hive_mobile_app/data/services/locator.dart';
import 'package:cobe_hive_mobile_app/data/shared/token_shared_preferences.dart';
import 'package:dio/dio.dart';

class TokenInterceptor extends Interceptor {
  final _prefsLocator = getIt.get<TokenSharedPreferences>();

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = _prefsLocator.getAccessToken();
    super.onRequest(options, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      _refreshToken();
    }
    super.onError(err, handler);
  }

  void _refreshToken() {}
}
