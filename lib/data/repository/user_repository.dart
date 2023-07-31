import 'package:cobe_hive_mobile_app/data/network/user_api.dart';
import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:dio/dio.dart';

class UserRepository {
  final UserApi userApi;
  UserRepository(this.userApi);

  Future<List<User>> getUsers() async {
    try {
      final response = await userApi.getUsers();
      final userList =
          (response.data as List).map((e) => User.fromJson(e)).toList();
      return userList;
    } on DioException catch (e) {
      final errorMessage = e.toString();
      throw errorMessage;
    }
  }
}
