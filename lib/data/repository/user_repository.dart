import 'package:cobe_hive_mobile_app/data/network/cobe_api.dart';
import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/connectivity_status_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userRepositoryProvider = Provider<UserRepository>(
    (ref) => UserRepository(ref.read(cobeApiProvider), ref));

class UserRepository {
  final CobeApi _cobeApi;
  final Ref ref;

  UserRepository(this._cobeApi, this.ref);

  final _userBox = Hive.box<User>('users');

  Future<List<User>> getUsers() async {
    if (await ref.read(internetConnectionProvider)) {
      return getUsersFromApi();
    }
    return getUsersFromHive();
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

  Future<List<User>> getUsersFromApi() async {
    try {
      final response = await _cobeApi.getUsers();
      final userList =
          (response.data as List).map((e) => User.fromJson(e)).toList();
      _userBox.addAll(userList);
      return userList;
    } catch (e) {
      debugPrint('Error during API call or JSON parsing: $e');
      return getUsersFromHive();
    }
  }

  Future<List<User>> getUsersFromHive() async =>
      Hive.box<User>('users').values.toList();
}
