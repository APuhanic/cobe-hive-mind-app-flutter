import 'package:cobe_hive_mobile_app/data/models/login_response.dart';
import 'package:cobe_hive_mobile_app/data/repository/login_repository.dart';
import 'package:cobe_hive_mobile_app/providers/login_screen_providers/email_provider.dart';
import 'package:cobe_hive_mobile_app/providers/login_screen_providers/password_provider.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/login_repository_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginProvider =
    StateNotifierProvider<LoginNotifier, LoginResponse>((ref) {
  return LoginNotifier(
    ref.read(loginRepositoryProvider),
    ref.watch(emailProvider),
    ref.watch(passwordProvider),
  );
});

class LoginNotifier extends StateNotifier<LoginResponse> {
  final LoginRepository loginRepository;
  final String email;
  final String password;
  LoginNotifier(this.loginRepository, this.email, this.password)
      : super(LoginResponse());

  Future<LoginResponse> login() async {
    final response = await loginRepository.login(email, password);
    return response;
  }
}
