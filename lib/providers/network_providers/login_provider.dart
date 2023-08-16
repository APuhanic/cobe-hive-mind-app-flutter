import 'package:cobe_hive_mobile_app/data/models/api_state.dart';
import 'package:cobe_hive_mobile_app/data/models/dio_exceptions.dart';
import 'package:cobe_hive_mobile_app/data/repository/login_repository.dart';
import 'package:cobe_hive_mobile_app/providers/login_screen_providers/email_provider.dart';
import 'package:cobe_hive_mobile_app/providers/login_screen_providers/password_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, ApiState<String>>(
    (ref) => LoginNotifier(ref));

class LoginNotifier extends StateNotifier<ApiState<String>> {
  final Ref ref;
  LoginNotifier(this.ref) : super(const ApiState.initial());

  Future<void> login() async {
    try {
      state = const ApiState.loading(null);
      final response = await ref.read(loginRepositoryProvider).login(
            ref.read(emailProvider),
            ref.read(passwordProvider),
          );
      state = ApiState.success(response);
    } on DioException catch (e) {
      state = ApiState.error(DioExceptions.fromDioError(e).message);
    }
  }
}
