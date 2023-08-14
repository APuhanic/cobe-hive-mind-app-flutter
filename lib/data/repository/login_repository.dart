import 'dart:convert';

import 'package:cobe_hive_mobile_app/data/network/cobe_api.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/cobe_api_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginRepositoryProvider = Provider<LoginRepository>(
    (ref) => LoginRepository(ref.read(cobeApiProvider)));

class LoginRepository {
  final CobeApi _cobeApi;

  LoginRepository(this._cobeApi);

  Future<String> login(String email, String password) async {
    final response = await _cobeApi.login(email, password);
    final userID = jsonDecode(response.data)['user_id'];
    return userID;
  }
}
