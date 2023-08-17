import 'dart:convert';

import 'package:cobe_hive_mobile_app/data/network/cobe_login_api.dart';
import 'package:cobe_hive_mobile_app/data/services/locator.dart';
import 'package:cobe_hive_mobile_app/data/shared/token_shared_preferences.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/logged_in_user_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TokenInterceptor extends Interceptor {
  final _prefsLocator = getIt.get<TokenSharedPreferences>();
  final Ref ref;
  final Dio dio;
  TokenInterceptor(
    this.ref,
    this.dio,
  );

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Authorization'] = _prefsLocator.getAccessToken();
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
      DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      await _refreshToken();
      var response = await dio.request(
        err.requestOptions.path,
        data: err.requestOptions.data,
        queryParameters: err.requestOptions.queryParameters,
        options: Options(
          method: err.requestOptions.method,
          headers: err.requestOptions.headers,
        ),
      );
      return handler.resolve(response);
    }

    super.onError(err, handler);
  }

  Future<void> _refreshToken() async {
    final response = await ref.read(cobeLoginApiProvider).refreshToken(
          _prefsLocator.getRefreshToken()!,
          ref.read(loggedInUserProvider)!.id!,
        );
    final data = jsonDecode(response.data);
    _prefsLocator.setAccessToken(data['access_token']);
    _prefsLocator.setRefreshToken(data['refresh_token']);
  }
}
