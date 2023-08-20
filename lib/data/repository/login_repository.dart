import 'dart:convert';

import 'package:cobe_hive_mobile_app/data/models/login_response.dart';
import 'package:cobe_hive_mobile_app/data/network/cobe_login_api.dart';
import 'package:cobe_hive_mobile_app/data/services/locator.dart';
import 'package:cobe_hive_mobile_app/data/shared/token_shared_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginRepositoryProvider = Provider<LoginRepository>(
    (ref) => LoginRepository(ref.read(cobeLoginApiProvider)));

class LoginRepository {
  final CobeLoginApi _cobeApi;

  LoginRepository(this._cobeApi);

  final _prefsLocator = getIt.get<TokenSharedPreferences>();

  Future<String> login(String email, String password) async {
    final response = await _cobeApi.login(email, password);
    try {
      final loginResponse = LoginResponse.fromJson(jsonDecode(response.data));
      await _prefsLocator.setAccessToken(loginResponse.accessToken!);
      await _prefsLocator.setRefreshToken(loginResponse.refreshToken!);
      return loginResponse.userId!;
    } catch (e) {
      rethrow;
    }
  }
}
