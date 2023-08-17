import 'package:cobe_hive_mobile_app/data/network/dio_client.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/dio_client_provider.dart';
import 'package:dio/dio.dart';

import 'package:cobe_hive_mobile_app/data/constants/endpoints.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final cobeLoginApiProvider = Provider<CobeLoginApi>(
    (ref) => CobeLoginApi(ref.watch(dioLoginClientProvider)));

class CobeLoginApi {
  final DioLoginClient _dioLoginClient;

  CobeLoginApi(this._dioLoginClient);

  Future<Response> login(String email, String password) async =>
      await _dioLoginClient.post(
        Endpoints.login,
        {
          'email': email,
          'password': password,
        },
      );

  Future<Response> refreshToken(String refreshToken, String userId) async =>
      await _dioLoginClient.post(
        Endpoints.refresh,
        {
          'refresh_token': refreshToken,
          'user_id': userId,
        },
      );
}
