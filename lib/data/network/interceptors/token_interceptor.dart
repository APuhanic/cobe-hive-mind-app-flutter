import 'package:cobe_hive_mobile_app/data/services/locator.dart';
import 'package:cobe_hive_mobile_app/data/shared/token_shared_preferences.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/cobe_api_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TokenInterceptor extends Interceptor {
  final _prefsLocator = getIt.get<TokenSharedPreferences>();

  final Ref ref;
  TokenInterceptor(this.ref);

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

  void _refreshToken() {
    ref.read(cobeApiProvider);
  }
}
