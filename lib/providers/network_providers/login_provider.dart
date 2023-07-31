import 'package:cobe_hive_mobile_app/providers/login_screen_providers/email_provider.dart';
import 'package:cobe_hive_mobile_app/providers/login_screen_providers/password_provider.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/user_api_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:cobe_hive_mobile_app/data/network/user_api.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, Response>((ref) {
  final email = ref.watch(emailProvider);
  final password = ref.watch(passwordProvider);
  return LoginNotifier(
    ref.read(userApiProvider),
    email,
    password,
  );
});

class LoginNotifier extends StateNotifier<Response> {
  final UserApi userApi;
  final String email;
  final String password;
  LoginNotifier(this.userApi, this.email, this.password)
      : super(
          Response(
            data: {},
            statusCode: 0,
            requestOptions: RequestOptions(path: ''),
          ),
        );

  Future<Response> login() async {
    try {
      final response = await userApi.login(email, password);
      return response;
    } on DioException catch (e) {
      if (e.response != null && e.response?.statusCode == 401) {
        return e.response!;
      } else {
        return Response(
          data: {},
          statusCode: 401,
          requestOptions: RequestOptions(path: ''),
        );
      }
    }
  }
}
