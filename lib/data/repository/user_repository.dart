import 'package:cobe_hive_mobile_app/data/network/cobe_api.dart';
import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/cobe_api_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>(
    (ref) => UserRepository(ref.read(cobeApiProvider)));

class UserRepository {
  final CobeApi _cobeApi;
  UserRepository(this._cobeApi);

  Future<List<User>> getUsers() async {
    try {
      final response = await _cobeApi.getUsers();
      final userList =
          (response.data as List).map((e) => User.fromJson(e)).toList();
      await Future.delayed(const Duration(seconds: 2));
      return userList;
    } on DioException catch (e) {
      final errorMessage = e.toString();
      throw errorMessage;
    }
  }

  Future<User> getUserById(String id) async {
    try {
      final response = await _cobeApi.getUserById(id);
      final user = User.fromJson(response.data);
      return user;
    } on DioException catch (e) {
      final errorMessage = e.toString();
      throw errorMessage;
    }
  }
}
