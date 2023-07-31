import 'package:cobe_hive_mobile_app/data/models/user.dart';
import 'package:cobe_hive_mobile_app/data/repository/user_repository.dart';
import 'package:cobe_hive_mobile_app/providers/network_providers/user_repository_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class UserDataNotifier extends StateNotifier<List<User>> {
  UserDataNotifier(this.userRepository) : super([]) {
    getUsers();
  }
  final UserRepository userRepository;

  Future<void> getUsers() async {
    await userRepository.getUsers().then((value) {
      debugPrint('value: $value');
      state = value;
    });
  }
}

final userDataProvider =
    StateNotifierProvider<UserDataNotifier, List<User>>((ref) {
  return UserDataNotifier(ref.read(userRepositoryProvider));
});
