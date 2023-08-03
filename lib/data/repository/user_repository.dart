import 'package:cobe_hive_mobile_app/data/network/cobe_api.dart';
import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final CobeApi _cobeApi;
  UserRepository(this._cobeApi);

  Future<List<User>> getUsers() async {
    try {
      final response = await _cobeApi.getUsers();
      final userList =
          (response.data as List).map((e) => User.fromJson(e)).toList();
      return userList;
    } on DioException catch (e) {
      final errorMessage = e.toString();
      throw errorMessage;
    }
  }
}
