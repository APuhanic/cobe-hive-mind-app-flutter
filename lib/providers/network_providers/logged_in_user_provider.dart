import 'package:cobe_hive_mobile_app/data/models/api_state.dart';
import 'package:cobe_hive_mobile_app/data/models/dio_exceptions.dart';
import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:cobe_hive_mobile_app/data/repository/user_repository.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/login_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loggedInUserProvider =
    Provider<User?>((ref) => ref.watch(loggedInUserNotifierProvider).maybeWhen(
          success: (user) => user,
          orElse: () => null,
        ));

final loggedInUserNotifierProvider =
    StateNotifierProvider<UserNotifier, ApiState<User>>(
  (ref) => UserNotifier(ref),
);

class UserNotifier extends StateNotifier<ApiState<User>> {
  final Ref ref;
  UserNotifier(this.ref) : super(const ApiState.initial()) {
    _listenUserChange();
  }

  _listenUserChange() {
    ref.listen(loginProvider, (_, state) {
      state.maybeWhen(
        orElse: () => const ApiState.initial(),
        success: (id) => _getUser(id),
      );
    });
  }

  _getUser(String id) async {
    try {
      state = const ApiState.loading(null);
      final user = await ref.read(userRepositoryProvider).getUserById(id);
      state = ApiState.success(user);
    } on DioException catch (e) {
      state = ApiState.error(DioExceptions.fromDioError(e).toString());
    }
  }
}
