import 'package:cobe_hive_mobile_app/data/models/api_state.dart';
import 'package:cobe_hive_mobile_app/data/models/login_response.dart';
import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:cobe_hive_mobile_app/data/repository/login_repository.dart';
import 'package:cobe_hive_mobile_app/providers/login_screen_providers/email_provider.dart';
import 'package:cobe_hive_mobile_app/providers/login_screen_providers/password_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginProvider = StateNotifierProvider<LoginNotifier, ApiState<User>>(
  (ref) => LoginNotifier(
    ref.read(loginRepositoryProvider),
    ref,
  ),
);

class LoginNotifier extends StateNotifier<ApiState<User>> {
  final LoginRepository loginRepository;

  final Ref ref;
  LoginNotifier(this.loginRepository, this.ref)
      : super(
          const ApiState.initial(),
        );

  Future<void> login() async {
    state = const ApiState.loading(null);
    final response = await loginRepository.login(
      ref.read(emailProvider),
      ref.read(passwordProvider),
    );
    if (response.statusCode == 200) {
      state = ApiState.success(response.user!);
    } else {
      state = ApiState.error(response.user!);
    }
  }
}
