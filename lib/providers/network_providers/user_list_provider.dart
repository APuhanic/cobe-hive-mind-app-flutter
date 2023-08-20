import 'package:cobe_hive_mobile_app/data/models/api_state.dart';
import 'package:cobe_hive_mobile_app/data/models/dio_exceptions.dart';
import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:cobe_hive_mobile_app/data/repository/user_repository.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final userListProvider =
    StateNotifierProvider<UserListNotifier, ApiState<List<User>>>(
        (ref) => UserListNotifier(ref));

class UserListNotifier extends StateNotifier<ApiState<List<User>>> {
  final Ref ref;
  UserListNotifier(this.ref) : super(const ApiState.initial()) {
    getUsers();
  }

  getUsers() async {
    state = const ApiState.loading(null);
    try {
      final users = await ref.read(userRepositoryProvider).getUsers();
      state = ApiState.success(users);
    } on DioException catch (e) {
      state = ApiState.error(DioExceptions.fromDioError(e).toString());
    }
  }
}

final userProvider = Provider.family<User?, String>((ref, id) => ref
    .watch(userListProvider)
    .maybeWhen(
        orElse: () => null,
        success: (users) => users.firstWhere((user) => user.id == id)));
