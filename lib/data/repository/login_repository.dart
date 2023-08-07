import 'dart:convert';

import 'package:cobe_hive_mobile_app/data/models/login_response.dart';
import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:cobe_hive_mobile_app/data/network/cobe_api.dart';
import 'package:dio/dio.dart';

class LoginRepository {
  final CobeApi _cobeApi;

  LoginRepository(this._cobeApi);

  Future<LoginResponse> login(String email, String password) async {
    try {
      final response = await _cobeApi.login(email, password);
      final userID = jsonDecode(response.data)['user_id'];
      final user = await _cobeApi.getUserById(userID);
      return LoginResponse(
        userID: userID,
        user: User.fromJson(user.data),
        statusCode: response.statusCode,
      );
    } on DioException catch (e) {
      if (e.response != null && e.response?.statusCode == 401) {
        return LoginResponse(statusCode: 401);
      }
      return LoginResponse(statusCode: 500);
    }
  }
}
