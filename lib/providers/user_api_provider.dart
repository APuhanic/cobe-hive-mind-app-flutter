import 'package:cobe_hive_mobile_app/data/network/dio_client.dart';
import 'package:cobe_hive_mobile_app/data/network/user_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioClientProvider = Provider<DioClient>((ref) => DioClient(Dio()));

final userApiProvider = Provider<UserApi>((ref) {
  return UserApi(ref.watch(dioClientProvider));
});

class LoginNotifier extends StateNotifier<Response> {
  LoginNotifier(this.userApi)
      : super(
          Response(
            data: {},
            statusCode: 0,
            requestOptions: RequestOptions(path: ''),
          ),
        );
  UserApi userApi;
  Future<Response> login(String email, String password) async {
    try {
      final response = await userApi.login(email, password);
      debugPrint('RESPONSE DATA ${response.data.toString()}');
      return response;
    } catch (e) {
      debugPrint('ERROR $e');
      rethrow;
    }
  }
}

final loginProvider = StateNotifierProvider<LoginNotifier, Response>(
    (ref) => LoginNotifier(ref.read(userApiProvider)));
